import 'package:dio/dio.dart';
import 'package:task_todo/App/Error/exception.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/Features/Data/DataSource/auth_data_source.dart';
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';
import 'package:task_todo/Features/Domain/Repository/base_auth_repository.dart';
import 'package:task_todo/Features/Domain/UseCases/login_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/logout_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/profile_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/register_use_case.dart';


class AuthRepository extends BaseAuthRepository {
  final BaseAuthDataSource _baseAuthDataSource;

  AuthRepository(this._baseAuthDataSource);


  @override
  Future<({Failures? failures, Response? value})> login(LoginParameters parameters) async {
    // TODO: implement createBrands

    return await _baseAuthDataSource.api.repository(
        value: _baseAuthDataSource.login(parameters)
    );

  }



  @override
  Future<({Failures? failures, Response? value})> register(RegisterParameters parameters) async {
    // TODO: implement deleteBrands

    return await _baseAuthDataSource.api.repository(
        value: _baseAuthDataSource.register(parameters)
    );

  }


  @override
  Future<({Failures? failures, UserEntities? value})> profile(ProfileParameters parameters) async {
    // TODO: implement createBrands
    UserEntities? data;
    Failures? failures;

    try{
      data = await _baseAuthDataSource.getProfileData(parameters);
    } on ServerException catch(err) {
      failures = ServerFailure(msg: err.errorMessage.msg,local: err.local);
    } on LocalException catch(err) {
      failures = LocalFailure(msg: err.msg,local: err.local);
    }

    return (failures: failures, value: data);
  }

  @override
  Future<({Failures? failures, Response? value})> logout(LogOutParameters parameters) async {
    // TODO: implement logout

    return await _baseAuthDataSource.api.repository(
        value: _baseAuthDataSource.logOut(parameters)
    );
  }


}