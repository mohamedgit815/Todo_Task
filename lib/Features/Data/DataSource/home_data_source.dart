import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/App/databases/api/api_consumer.dart';
import 'package:task_todo/App/databases/api/dio_consumer.dart';
import 'package:task_todo/Features/Data/Models/home_model.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/delete_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/details_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/upload_use_case.dart';



abstract class BaseHomeDataSource {
  late ApiConsumer api;
  
  BaseHomeDataSource({required FlutterSecureStorage secureStorage}) {
    api = DioConsumer(secureStorage: secureStorage);
  }
  
  Future<Response> getHomeData(HomeParameters params);


  Future<HomeEntities> getDetailsHomeData(DetailsHomeParameters params);


  Future<Response> uploadDataToHome(UploadParameters params);


  Future<Response> deleteHome(DeleteHomeParameters params);

}

class HomeDataSource extends BaseHomeDataSource {
  
  HomeDataSource({required super.secureStorage});
  
  @override
  Future<HomeEntities> getDetailsHomeData(DetailsHomeParameters params) async {
    // TODO: implement getDetailsHomeData
    final Response response = await api.get('${App.endPoints.homeUrl}/${params.id}');

    return HomeModel.fromJson(response.data);
  }

  @override
  Future<Response> getHomeData(HomeParameters params) async {
    // TODO: implement getHomeData

    final Response response = await api.get(
        App.endPoints.homeUrl ,
        queryParameters: {
        "page": params.page ,
    });
     return response;
  }

  @override
  Future<Response> uploadDataToHome(UploadParameters params) async {
    // TODO: implement uploadDataToHome

    final Response response = await api.post(App.endPoints.homeUrl, data: {
       //"image": "test.png" ,
     "image": params.image ,
      "priority": params.priority ,
      "dueDate": params.dueDate ,
      "title": params.title ,
      "desc": params.desc ,
    });

    return response;
  }


  @override
  Future<Response> deleteHome(DeleteHomeParameters params) async {
    // TODO: implement deleteHome
    final Response response = await api.delete('${App.endPoints.homeUrl}/${params.id}');
    return response;
  }
  
}