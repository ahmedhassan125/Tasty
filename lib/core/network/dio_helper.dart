
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:yumzy/core/network/secure_storege_helper.dart';



class DioHelper {
   late final Dio dio;

  DioHelper(this.dio);

   Future<void> init() async {
    dio.options = BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    );

    //////////////////////////////التحقق عن طريق الشهاده فقط////////////////////
    final certData = await rootBundle.load('assets/certs/server_cert.cer');
    final securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(certData.buffer.asUint8List());
    final httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
          return false;
        };
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () => httpClient,
    );
    //*****************************dio interceptors****************************

    //set  & get token frm secure storage
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageHelper.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            await SecureStorageHelper.clearToken();
          }
          return handler.next(error);
        },
      ),
    );
  }
}
