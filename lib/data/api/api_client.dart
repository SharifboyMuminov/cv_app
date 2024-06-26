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
        "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MjAwOTg1NjAsImlhdCI6MTcxOTM3ODU2MCwiaXNzIjoiIiwicm9sZSI6InVzZXIiLCJzdWIiOiJhNzRjMDhmNS1jNTY2LTRhOWEtYTg0Ni02YjdiN2QxODY0MTIifQ.OoD03-Oiq-noT-gogbvTFYWbwvZKVgU4YEfVfso9708"
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
