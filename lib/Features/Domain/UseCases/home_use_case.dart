import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Repository/base_home_repository.dart';


class HomeUseCases extends BaseUseCase<Response?, HomeParameters> {
  final BaseHomeRepository _baseHomeRepository ;

  HomeUseCases(this._baseHomeRepository);

  @override
  Future<({Failures? failures, Response? value})> call(HomeParameters parameters) async {
    // TODO: implement call
    return await _baseHomeRepository.getHomeData(parameters);
  }
}

class HomeParameters extends Equatable {
  final String? status;
  final int page;

  const HomeParameters({required this.status, required this.page});

  @override
  // TODO: implement props
  List<Object?> get props => [status, page];
}