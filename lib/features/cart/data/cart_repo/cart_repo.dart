import 'package:yumzy/core/network/api_service.dart';

import '../../../home/data/models/side_option_model.dart';
import '../../../home/data/models/topping_model.dart';
import '../cart_model/get_cart_model.dart';

class CartRepo {
  final ApiService apiService;
  CartRepo(this.apiService);

  //final ApiService apiService = ApiService();

  //*********************************************** Add To Cart //********************************************

  Future<String> addToCart({
    //required String token,
    required String endPoint,
    required List<Map<String, dynamic>> dataList,
  }) async {
    final response = await apiService.postData(
      endPoint: endPoint,
      data: {"items": dataList},
     // token: token,
    );
    return response['message'];
  }

  //*********************************************** Get Cart //**********************************************

  Future<GetCartModel> getCart(
     // {required String token}
      ) async {
    final response = await apiService.getData(endpoint: '/cart',);
    return GetCartModel.fromJson(response);
  }
//*********************************************** Delete From Cart //****************************************

  Future<Map<String, dynamic>> deleteFromCart({
    // required int itemId,
    required String endPoint,
   // required String token,
  }) async {
    final response = await apiService.deleteData(
      endPoint: endPoint,
     // token: token,
    );
    return response;
  }






  Future<ToppingModel> getTopping()async{
    final response = await apiService.getData(endpoint: '/toppings');
    return ToppingModel.fromJson(response);

  }

  Future<SideOptionsModel> getSideOptions()async{
    final response = await apiService.getData(endpoint: '/side-options');
    return SideOptionsModel.fromJson(response);
  }


}
