import 'package:dio/dio.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/databases/api/end_points.dart';


abstract class ApiConsumer {
  final Dio dio = Dio();
  final EndPoints endPoints = EndPoints();
  final ApiKey apiKey = ApiKey();
  final Map<String, dynamic> option = <String, dynamic>{
    "transports": ['websocket'] ,
    'autoConnect': false
  };

  //Socket initSocket({String? key, String? value});

  Future<({Failures? failures, Response? value})> repository({required Future<Response> value});

  Future<Response> get(
    String path, {
    Object? data ,
    String? token ,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post(
    String path, {
    String? token ,
    dynamic data ,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false ,
  });

  Future<Response> patch(
    String path, {
    dynamic data,
    String? token ,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<Response> put(
      String path, {
        dynamic data,
        String? token ,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false,
      });

  Future<Response> delete(
    String path, {
    String? token ,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
