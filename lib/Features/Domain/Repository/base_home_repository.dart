import 'package:dio/dio.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/delete_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/details_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/upload_use_case.dart';


abstract class BaseHomeRepository {

  Future<({Failures? failures, Response? value})> getHomeData(HomeParameters params);


  Future<({Failures? failures, Response? value})> uploadHomeData(UploadParameters params);


  Future<({Failures? failures, Response? value})> deleteHomeData(DeleteHomeParameters params);


  Future<({Failures? failures, HomeEntities? value})> getDetailsHomeData(DetailsHomeParameters params);

}