
import 'package:dio/dio.dart';

String handleDioError(DioException error) {


  final statusCode = error.response?.statusCode;
  final data = error.response?.data;

  String? serverMessage;
  if (data is Map<String, dynamic>) {
    serverMessage = data['message']?.toString();
  }

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout. Please check your internet connection.';
    case DioExceptionType.sendTimeout:
      return 'Send timeout. Please try again.';
    case DioExceptionType.receiveTimeout:
      return 'Receive timeout. The server took too long to respond.';
    case DioExceptionType.badResponse:
      if (statusCode == 400) return serverMessage ?? 'Bad request (400)';
      if (statusCode == 401) return serverMessage ?? 'Unauthorized (401)';
      if (statusCode == 404) return serverMessage ?? 'Not found (404)';
      if (statusCode == 500) return 'server is down, please try again later (500)';
      if (statusCode == 429) return 'You sent too many requests, please try again later.';
      return serverMessage ?? 'Server error ($statusCode)';
    case DioExceptionType.cancel:
      return 'Request was cancelled.';
    case DioExceptionType.unknown:
      if (error.error.toString().contains('SocketException')) {
        return 'No internet connection.';
      }
      return 'Unexpected network error.';
    default:
      return 'Something went wrong, please try again later.';
  }
}
