import 'package:dio/dio.dart';
import 'package:yumzy/core/network/dio_helper.dart';

import 'api_exceptions.dart';

class ApiService {
  final DioHelper dioHelper;

  ApiService(this.dioHelper);
  Future<Map<String, dynamic>> getData({
    required String endpoint,
    //String? token,
    Map<String , dynamic>? query,
  }) async {
    try {
      final response = await dioHelper.dio.get(
        endpoint,
        queryParameters: query,
        // options: Options(
        //   headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        // ),
      );
      return response.data;
    } on DioException catch (error, stackTrace) {
    //  await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      throw Exception(handleDioError(error));
    } catch (error,stackTrace) {
     // await FirebaseCrashlytics.instance.recordError(error, stackTrace);

      throw Exception("Unexpected error: $error");
    }
  }

  //****************************************** Post Date **********************************************
  Future<dynamic> postData({
    required String endPoint,
    dynamic data,
   // String? token,
  }) async {
    try {
      final response = await dioHelper.dio.post(
        endPoint,
        data: data,
       // options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } on DioException catch (error,stackTrace) {
    //  await FirebaseCrashlytics.instance.recordError(error, stackTrace);

      throw Exception(handleDioError(error));
    } catch (error,stackTrace) {
     // await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      throw Exception("Unexpected error: $error");
    }
  }

  //****************************************** delete Date **********************************************
  Future<dynamic> deleteData({
    required String endPoint,
   // required String token,
  }) async {
    try {
      final response = await dioHelper.dio.delete(
        endPoint,
       // options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } on DioException catch (error,stackTrace) {
    //  await FirebaseCrashlytics.instance.recordError(error, stackTrace);

      throw Exception(handleDioError(error));
    } catch (error,stackTrace) {
    //  await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      throw Exception(error.toString());
    }
  }
}
