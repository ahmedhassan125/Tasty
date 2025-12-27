import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/core/network/api_service.dart';
import 'package:yumzy/core/network/dio_helper.dart';
import 'package:yumzy/features/cart/data/cart_repo/cart_repo.dart';
import 'package:yumzy/features/cart/data/cart_model/get_cart_model.dart';
import '../../../../core/network/secure_storege_helper.dart';
import '../../../home/data/models/side_option_model.dart';
import '../../../home/data/models/topping_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(DioHelper dioHelper) : cartRepo = CartRepo(ApiService(dioHelper)) ,super(CartInitial());

  //CartRepo cartRepo = CartRepo();

  static CartCubit get(context) => BlocProvider.of(context);
  double sliderValue = 0.5;
  bool isSelected = false;

  List<int> selectedTopping = [];

  void toggleTopping(int id) {
    if (selectedTopping.contains(id)) {
      selectedTopping.remove(id);
    } else {
      selectedTopping.add(id);
    }
    emit(SelectedToppingState());
  }

  List<int> selectedSideOption = [];

  void toggleSideOption(int id) {
    if (selectedSideOption.contains(id)) {
      selectedSideOption.remove(id);
    } else {
      selectedSideOption.add(id);
    }
    emit(SelectedSideOptionState());
  }

  void sliderChange(value) {
    sliderValue = value;
    emit(SliderChangeState());
  }
  //************************************** Add To  cart *************************

  Future<void> addToCart({
    required int productId,
    required int quantity,
    double? spicy,
    List<int>? toppings,
    List<int>? sideOptions,
  }) async {
    if (await _needLogin()) return;
    emit(AddToCartLoadingState());
    try {
       await cartRepo.addToCart(
        endPoint: '/cart/add',
        dataList: [
          {
            "product_id": productId,
            "quantity": quantity,
            "spicy": spicy,
            "toppings": toppings,
            "side_options": sideOptions,
          },
        ],
      );
      emit(AddToCartSuccessState());
      selectedTopping = [];
      selectedSideOption = [];
      getCart();
    }  catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(AddToCartErrorState(error.toString()));
    }
  }
  //************************************** Get cart *************************

  List<Items> selectedCartItems = [];
  GetCartModel getCartModel = GetCartModel();
  Future<void> getCart() async {
    if (await _needLogin()) return;
    emit(GetCartLoadingState());
    try {
      final response = await cartRepo.getCart();
      if (response.data == null || response.data!.items == null) {
        emit(GetCartErrorState("Filed to load cart Items"));
        return;
      }
      getCartModel = response;
      selectedCartItems = response.data!.items!;
      emit(GetCartSuccessState(response));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetCartErrorState(error.toString()));
    }
  }

  //**************************** convert List of item to List<Map<String , dynamic>> for save order method *************************

  List<Map<String, dynamic>> convertSelectedItems() {
    return selectedCartItems.map((item) {
      return {
        "product_id": item.productId,
        "quantity": item.quantity,
        "spicy": item.spicy,
        "toppings": item.toppings?.map((t) => t.id).toList() ?? [],
        "side_options": item.sideOptions?.map((s) => s.id).toList() ?? [],
      };
    }).toList();
  }

  //************************************** delete From cart *************************
  Future<void> deleteFromCart({
    required int index,
    required String itemId,
  }) async {
    if (await _needLogin()) return;
    emit(DeleteFromCartLoadingState(index: index));
    try {
      final response = await cartRepo.deleteFromCart(
        endPoint: '/cart/remove/$itemId',
       // token: token,
      );
      emit(DeleteFromCartSuccessState(response['message']));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(DeleteFromCartErrorState(error.toString()));
    }
  }

  //******************************************* Get Topping //************************************************
  ToppingModel toppingModel = ToppingModel();
  List<dynamic> topping = [];
  Future<void> getTopping() async {
    emit(GetToppingLoadingState());
    try {
      final response = await cartRepo.getTopping();
      topping = response.data ?? [];
      toppingModel = response;
      emit(GetToppingSuccessState());
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetToppingErrorState(error.toString()));
    }
  }
  //******************************************* Side Option //************************************************

  SideOptionsModel sideOptionsModel = SideOptionsModel();
  List<dynamic> sideOption = [];
  Future<void> getSideOption() async {
    emit(GetSideOptionLoadingState());
    try {
      final response = await cartRepo.getSideOptions();
      sideOption = response.data ?? [];
      emit(GetSideOptionSuccessState());
      sideOptionsModel = response;
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetSideOptionErrorState(error.toString()));
    }
  }

  //******************************************* Get Addition //************************************************

  void getAddition() async {
    await Future.wait([
      if (topping.isEmpty) getTopping(),
      if (sideOption.isEmpty) getSideOption(),
    ]);
  }

  //******************************************* Quantity Plus //************************************************
  void quantityPlus({required int index}) {
    final item = getCartModel.data!.items![index];
    if (item.quantity == 1 || item.quantity! > 1) {
      item.quantity = item.quantity! + 1;
    }
    emit(QuantityPlusState(index));

  }

  //******************************************* Quantity Minus //************************************************
  void quantityMinus({required int index}) {
    final item = getCartModel.data!.items![index];
    if (item.quantity == 2 || item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
    }
    emit(QuantityMinusState(index));
  }

  //******************************************* Total Price //************************************************

  double get totalPrice {
    double total = 0.0;
    for (var item in selectedCartItems) {
      total += (item.priceDouble * (item.quantity ?? 1));
    }
    return total;
  }

  double get tax => totalPrice * 0.14;
  double get delivery => 30.0;
  double get finalPrice => totalPrice + tax + delivery;



//******************************************* Cart Restart //************************************************

void restartCart(){
  selectedCartItems = [];
  emit(CartRestart());
}


  Future<bool> _needLogin() async {
    final token = await SecureStorageHelper.getToken();
    if (token == null || token.trim().isEmpty) {
      emit(WarningCartState("You must log in to continue",));
      return true;
    }
    return false;
  }
}
