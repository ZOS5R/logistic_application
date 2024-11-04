import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio()
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      _addDioHeaders();
      _addDioInterceptor();
    }

    return _dio!;
  }

  static void _addDioHeaders() {
    // Set common headers
    _dio?.options.headers = {
      // 'X-Secret-Token': dotenv.get('X_SECRET_TOKEN'),
      'Content-Type': 'application/json', // Add content type
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void _addDioInterceptor() {
    // Add a logger interceptor
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    // Add error handling interceptor
    _dio?.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, ErrorInterceptorHandler handler) {
        // Log detailed error information
        print('Error occurred: ${e.message}');
        print('Request: ${e.requestOptions}');
        if (e.response != null) {
          print('Response: ${e.response?.data}');
          print('Status Code: ${e.response?.statusCode}');
        } else {
          print('Request failed without response: ${e.requestOptions.data}');
        }
        // Handle specific status codes if necessary
        // if (e.response?.statusCode == 401) {
        //   // Handle unauthorized access
        // }
        handler.next(e); // Continue to the next interceptor
      },
    ));
  }
}
