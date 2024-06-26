import 'package:cv_app/data/local/storage_repository.dart';
import 'package:dio/dio.dart';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;
  late Dio secureDio;

  void _init() {
    dio = Dio();
    secureDio = Dio();

    dio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
      receiveTimeout: const Duration(seconds: 10),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );

    secureDio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        "Authorization": StorageRepository.getString(key: "access_token")
      },
      receiveTimeout: const Duration(seconds: 5),
    );

    secureDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
}
