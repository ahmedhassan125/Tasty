import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/core/network/api_service.dart';
import 'package:yumzy/features/auth/screen/profile_screen.dart';
import 'package:yumzy/features/cart/screen/cart_Screen.dart';
import 'package:yumzy/features/home/screen/home_screen.dart';
import 'package:yumzy/features/orderHistory/screen/order_history_screen.dart';
import '../../../../core/network/dio_helper.dart';
import '../models/all_product_model.dart';
import '../home_repo/home_repo.dart';
import 'home_state.dart';
import 'package:yumzy/features/home/data/models/category_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo;
  HomeCubit(DioHelper dioHelper) :homeRepo = HomeRepo(ApiService(dioHelper)), super(HomeInitialState());


  //final HomeRepo homeRepo = HomeRepo();
  static HomeCubit get(context) => BlocProvider.of(context);



  final List<Widget> screen = const [
    HomeScreen(),
    CartScreen(),
    OrderHistoryScreen(),
    ProfileScreen(),
  ];
  //******************************************* Bottom Nav change //************************************************
  int currantIndex = 0;
  void bottomNavChange(index) {
    currantIndex = index;
    emit(BottomNavChange());
  }

  int selectedIndex = 0;
  void categorySelected(index) {
    selectedIndex = index;
    emit(CategorySelectedChange());
  }

  //******************************************* Get Category //************************************************
  List<Category> categories = [];
  Future<void> getCategory() async {
    emit(GetCategoryLoadingState());
    try {
      final response = await homeRepo.getCategory();
      categories = response.categories ?? [];
      emit(GetCategorySuccessState(response));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetCategoryErrorState(error.toString()));
    }
  }
  //******************************************* Get Products //************************************************
  List<Data> products = [];
  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    print('GetProductsLoadingState');
    try {
      final response = await homeRepo.getProduct();
      products = response.data ?? [];
      searchItems = products;
      emit(GetProductsSuccessState(response));
      print('GetProductsSuccessState');

    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetProductsErrorState(error.toString()));
    }
  }
  //******************************************* toggle Favourite  //************************************************

  void toggleFavourite({required int index}){
    products[index].isFavourite = !products[index].isFavourite;
    emit(IsFavouriteStateChange(index: index));
  }
  //******************************************* search Products //************************************************
  // local search 3lshan ana zh2t mn el Api
  List<Data> searchItems = [];
  final TextEditingController searchController = TextEditingController();
  bool isSelected = false;
  void search({required String value}) {
    if (value.isEmpty) {
      searchItems = products;
    } else {
      searchItems = products
          .where(
            (product) =>
                (product.name ?? '').toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    }
    emit(SearchProductsState());
  }
  //******************************************* Get Products By Category *****************************************
  Future<void> getProductsByCategory({required int id}) async {
    emit(GetProductsByCategoryLoadingState());

    try {
      final response = await homeRepo.getProductByCategory(id: id);
      products = response.data ?? [];
      searchItems = products;
      emit(GetProductsByCategorySuccessState(response));

    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetProductsByCategoryErrorState(error.toString()));
    }
  }
  //******************************************* Toggle Favourite *****************************************
//ana 3mlt el toggle de local
// Future<void> toggleFavourite(
  //     //{required int productId}
  //     ) async {
  //   final token = await SharedPrefHelper.getToken();
  //   if (token == null || token.trim().isEmpty) {
  //     emit(ToggleFavouriteErrorState("No token fount! You must log in first."));
  //     return;
  //   }
  //   emit(ToggleFavouriteLoadingState());
  //   print('ToggleFavouriteLoadingState');
  //   try {
  //     final response = await homeRepo.favourite(
  //       data: {"product_id": 1},
  //       token: token,
  //     );
  //     emit(ToggleFavouriteSuccessState());
  //     print('ToggleFavouriteSuccessState');
  //   } catch (error) {
  //     emit(ToggleFavouriteErrorState(error.toString()));
  //     print(error.toString());
  //   }
  // }
}
