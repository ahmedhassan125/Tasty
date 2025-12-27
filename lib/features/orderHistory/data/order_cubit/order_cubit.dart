import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/orderHistory/data/models/order_history_model.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/secure_storege_helper.dart';
import '../models/re_order_model.dart';
import '../order_repo/order_repo.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;

  OrderCubit(DioHelper dioHelper) : orderRepo = OrderRepo(ApiService(dioHelper)), super(OrderInitial());

//  OrderRepo orderRepo = OrderRepo(ApiService());


  static OrderCubit get(context) => BlocProvider.of(context);

  //************************************** Save Order History //*************************************
  Future<void> saveOrder({required List<Map<String, dynamic>> selectedCartItems}) async {
    if (await _needLogin()) return;
    emit(SaveOrderLoadingState());
    try {
      final response  = await orderRepo.saveOrder(
        selectedCartItems: selectedCartItems,
      );
      emit(SaveOrderSuccessState());

    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(SaveOrderErrorState(error.toString()));


    }
  }
  //************************************** Get Order History //*************************************

  List<Data> orderHistory = [];
  Future<void> getOrderHistory() async {
    if (await _needLogin()) return;
    emit(GetOrderLoadingState());
    try {
      final response = await orderRepo.getOrderHistory(
        endPoint: '/orders',
      );
      orderHistory = response.data?? [];
      emit(GetOrderSuccessState());
    } catch (error,stackTrace) {
      //await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      addError(error, stackTrace);
      emit(GetOrderErrorState(error.toString()));
    }
  }

  //************************************** Get Order Details //*************************************
  List<OrdersDetailsItems> ordersDetails = [];
  ReOrderModel reOrderModel = ReOrderModel();
  Future<void> getOrderDetails({required String id,required int index,
  }) async {
    if (await _needLogin()) return;
    emit(GetOrderDetailsLoadingState(index: index));
    try {
      final response = await orderRepo.getOrderDetails(
        endPoint: '/orders/$id',
      );
      reOrderModel = response;
      ordersDetails = response.data?.items ?? [];
      emit(GetOrderDetailsSuccessState(index: index));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetOrderDetailsErrorState(error.toString()));

    }
  }

  //************************************** *************************************

  bool cash = true;
  bool visa = false;
  void cashPayment() {
    cash = true;
    visa = false;
    emit(CashState());
  }
  void visaPayment() {
    visa = true;
    cash = false;
    emit(VisaState());
  }

  void restartOrderScreen(){
    orderHistory = [];
    emit(RestartOrder());
  }


  Future<bool> _needLogin() async {
    final token = await SecureStorageHelper.getToken();
    if (token == null || token.trim().isEmpty) {
      emit(WarningOrderState("You must log in to continue",));
      return true;
    }
    return false;
  }
}
