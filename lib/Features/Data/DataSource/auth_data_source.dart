import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/App/databases/api/api_consumer.dart';
import 'package:task_todo/App/databases/api/dio_consumer.dart';
import 'package:task_todo/Features/Data/Models/user_model.dart';
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/login_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/logout_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/profile_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/register_use_case.dart';

abstract class BaseAuthDataSource {
  late ApiConsumer api ;

  BaseAuthDataSource({required FlutterSecureStorage secureStorage}) {
    api = DioConsumer(secureStorage: secureStorage);
  }

  Future<Response> login(LoginParameters parameters);

  Future<Response> register(RegisterParameters parameters);

  Future<Response> logOut(LogOutParameters params);

  Future<UserEntities> getProfileData(ProfileParameters params);

}

class AuthDataSource extends BaseAuthDataSource {

  AuthDataSource({required super.secureStorage});

  @override
  Future<Response> login(LoginParameters parameters) async {
    // TODO: implement login
    return await api.post(App.endPoints.loginUrl, data: {
      "phone": "+20${parameters.phone}" ,
      "password": parameters.password
    });
  }


  @override
  Future<Response> register(RegisterParameters parameters) async {
    // TODO: implement register

    return await api.post(App.endPoints.registerUrl, data: {
      "phone": "+20${parameters.phone}" ,
      "password": parameters.password ,
      "displayName": parameters.name ,
      "experienceYears": parameters.years ,
      "address": parameters.address ,
      "level": parameters.level
    });
  }

  @override
  Future<Response> logOut(LogOutParameters params) async {
    return await api.post(App.endPoints.logoutUrl, data: {
      "token": params.refreshToken
    });
  }

  @override
  Future<UserEntities> getProfileData(ProfileParameters params) async {
    // TODO: implement getDetailsHomeData

      final Response response = await api.get(App.endPoints.profileUrl);

      return UserModel.fromJson(response.data);
  }

}