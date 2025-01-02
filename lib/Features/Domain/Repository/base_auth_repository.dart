import 'package:dio/dio.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/login_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/register_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/logout_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/profile_use_case.dart';



abstract class BaseAuthRepository {

  Future<({Failures? failures, Response? value})> login(LoginParameters parameters);

  Future<({Failures? failures, Response? value})> register(RegisterParameters parameters);

  Future<({Failures? failures, Response? value})> logout(LogOutParameters parameters);

  Future<({Failures? failures, UserEntities? value})> profile(ProfileParameters parameters);

}