import 'package:dio/dio.dart';
import 'package:task_todo/App/Error/exception.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Domain/Repository/base_home_repository.dart';
import 'package:task_todo/Features/Data/DataSource/home_data_source.dart';
import 'package:task_todo/Features/Domain/UseCases/delete_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/details_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/upload_use_case.dart';


class HomeRepository extends BaseHomeRepository {
  final BaseHomeDataSource _baseHomeDataSource;
  HomeRepository(this._baseHomeDataSource);


  @override
  Future<({Failures? failures, Response? value})> getHomeData(HomeParameters params) async {
    // TODO: implement getHomeData

    return await _baseHomeDataSource.api.repository(
        value: _baseHomeDataSource.getHomeData(params)
    );

  }

  @override
  Future<({Failures? failures, HomeEntities? value})> getDetailsHomeData(DetailsHomeParameters params) async {
    // TODO: implement getDetailsHomeData


    HomeEntities? data;
    Failures? failures;

    try{
      data = await _baseHomeDataSource.getDetailsHomeData(params);
    } on ServerException catch(err) {
      failures = ServerFailure(msg: err.errorMessage.msg,local: err.local);
    } on LocalException catch(err) {
      failures = LocalFailure(msg: err.msg,local: err.local);
    }

    return (failures: failures, value: data);
  }

  @override
  Future<({Failures? failures, Response? value})> uploadHomeData(UploadParameters params) async {
    // TODO: implement uploadHomeData

    return await _baseHomeDataSource.api.repository(
        value: _baseHomeDataSource.uploadDataToHome(params)
    );

  }

  @override
  Future<({Failures? failures, Response? value})> deleteHomeData(DeleteHomeParameters params) async {
    // TODO: implement deleteHomeData

    return await _baseHomeDataSource.api.repository(
        value: _baseHomeDataSource.deleteHome(params)
    );

  }

}