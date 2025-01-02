import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Repository/base_home_repository.dart';


class DeleteHomeUseCases extends BaseUseCase<Response?, DeleteHomeParameters> {
  final BaseHomeRepository _baseHomeRepository ;

  DeleteHomeUseCases(this._baseHomeRepository);

  @override
  Future<({Failures? failures, Response? value})> call(DeleteHomeParameters parameters) async {
    // TODO: implement call
    return await _baseHomeRepository.deleteHomeData(parameters);
  }
}

class DeleteHomeParameters extends Equatable {
  final String id;

  const DeleteHomeParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}