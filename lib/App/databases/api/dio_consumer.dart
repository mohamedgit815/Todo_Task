import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/Error/error_msg_model.dart';
import 'package:task_todo/App/Error/exception.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/databases/api/api_consumer.dart';
import 'package:task_todo/App/databases/api/end_points.dart';


class DioConsumer extends ApiConsumer {
  final FlutterSecureStorage secureStorage;

  DioConsumer({required this.secureStorage}) {


    dio.options.baseUrl = EndPoints.baseUrl;

    dio.interceptors.add(
        InterceptorsWrapper(

            onRequest: (options, handler) async {
              final String? accessToken = await secureStorage.read(key: 'accessToken');

              if(options.headers["authorization"] == null) {
                options.headers["authorization"] = "Bearer $accessToken";
              }

              return handler.next(options);
            },

            onError: (err, handler ) async {

              if(err.response?.statusCode == 401) {
                final newAccessToken = await refreshToken();

                if(newAccessToken.statusCode == 200) {
                  dio.options.headers["authorization"] =
                  "Bearer ${newAccessToken.data["access_token"]}";
                  return handler.resolve(await dio.fetch(err.requestOptions));
                }

                return handler.next(err);
              }


            }

        )
    );


  }

  ///! Connect Socket Io
  // @override
  // Socket initSocket({String? key, String? value}) {
  //   // TODO: implement initSocket
  //   if(key == null && value == null) {
  //     return io(endPoints.mainUrl, option).connect();
  //   } else {
  //     return io("${endPoints.mainUrl}/?$key=$value" , option).connect();
  //   }
  //
  // }


  Future<Response> refreshToken() async {
    final String? refreshToken = await secureStorage.read(key: "refreshToken");

    final Response response = await dio.get(
        "/auth/refresh-token",
        queryParameters: {"token": refreshToken}
    );

    await secureStorage.write(key: "accessToken", value: response.data["access_token"]);

    return response;

  }

  Future<Response> retry(RequestOptions options) async {
    final options_ = Options(
      method: options.method,
      headers: options.headers,
    );

    return await dio.request(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: options_
    );

  }


  @override
  Future<({Failures? failures, Response? value})> repository({
    required Future<Response> value
  }) async {
    // TODO: implement repository
    Response? data;
    Failures? failures;

    try{
      data = await value;
    } on ServerException catch(err) {
      failures = ServerFailure(msg: err.errorMessage.msg);
    } on LocalException catch(err) {
      failures = LocalFailure(msg: err.msg);
    }

    return (failures: failures, value: data);
  }


///!POST
  @override
  Future<Response> post(String path, {
    dynamic data,
    String? token ,
    bool isFormData = false ,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
       final Response response = await dio.post(
        path, //options: _options(token) ,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

       return _successfully(response);

    } on DioException catch (err) {
      throw _failure(err);
    }
  }


///!GET
  @override
  Future<Response> get(String path, {
    String? token ,
    Object? data,
    Map<String, dynamic>? queryParameters
  }) async {

    try {
      final Response response =
          await dio.get(
              path, data: data, //options: _options(token) ,
              queryParameters: queryParameters);

      return _successfully(response);

    } on DioException catch (err) {

      throw _failure(err);

    }
  }

//!DELETE
  @override
  Future<Response> delete(String path, {
    String? token ,
    Object? data,
    Map<String, dynamic>? queryParameters
  }) async {
    try {
      final Response response = await dio.delete(
        path, data: data, //options: _options(token) ,
        queryParameters: queryParameters);

      return _successfully(response);

    } on DioException catch (err) {
      throw _failure(err);
    }
  }


  ///!PUT
  @override
  Future<Response> put(String path, {
    dynamic data, String? token ,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false
  }) async {
    try {
      final Response response = await dio.put(
        path, //options: _options(token) ,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return _successfully(response);

    } on DioException catch (err) {
      throw _failure(err);
    }
  }


  ///!PATCH
  @override
  Future<Response> patch(String path, {
    dynamic data, String? token ,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false
  }) async {
    try {
      final Response response = await dio.patch(
        path, //options: _options(token) ,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );


      return _successfully(response);

    } on DioException catch (err) {
      throw _failure(err);
    }
  }

  Response<dynamic> _successfully(Response response) {
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw ServerException(errorMessage: ErrorModel(msg: response.statusMessage.toString()));
    }
  }

  Exception _failure(DioException err) {
    if(err.response == null) {
      throw LocalException(msg: "'check your connection': ${err.message}", local: true);
    } else {
      throw handleDioException(err);
    }
  }


}
