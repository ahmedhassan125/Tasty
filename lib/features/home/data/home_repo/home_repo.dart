import 'package:yumzy/core/network/api_service.dart';

import '../models/all_product_model.dart';
import '../models/category_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);


 // ApiService apiService = ApiService();

  Future<CategoryModel> getCategory() async {
    final response = await apiService.getData(endpoint: '/categories');
    return CategoryModel.fromJson(response);
  }

  Future<FullProduct> getProduct() async {
    final response = await apiService.getData(endpoint: '/products');
    return FullProduct.fromJson(response);
  }


  Future<FullProduct> getProductByCategory({required int id}) async {
    final response = await apiService.getData(
      endpoint: '/products',
      query: {'category_id': id},
    );
    return FullProduct.fromJson(response);
  }



  Future<String> favourite({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    final response = await apiService.postData(
      endPoint: '/toggle-favorite',
    //  token: token,
      data: data,
    );
    return response['message'];
  }
}
