import 'package:yumzy/core/network/api_service.dart';
import 'package:yumzy/features/orderHistory/data/models/order_history_model.dart';

import '../models/re_order_model.dart';

class OrderRepo {
  final ApiService apiService;

  OrderRepo(this.apiService);
 // final ApiService apiService = ApiService();
  //************************************** Save Order  //*************************************

  Future<String> saveOrder({
    required List<Map<String, dynamic>> selectedCartItems,
  }) async {
    final response = await apiService.postData(
      endPoint: '/orders',
      data: {"items": selectedCartItems},
    );
    return response['message'];
  }

  //************************************** Get Order History //*************************************
  Future<OrderHistoryModel> getOrderHistory({required String endPoint}) async {
    final response = await apiService.getData(endpoint: endPoint);
    return OrderHistoryModel.fromJson(response);
  }

  //************************************** Re Order By Id//*************************************
  Future<ReOrderModel> getOrderDetails({required String endPoint}) async {
    final response = await apiService.getData(endpoint: endPoint);
    return ReOrderModel.fromJson(response);
  }
}
