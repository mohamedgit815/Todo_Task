import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Repository/base_home_repository.dart';



class UploadUseCases extends BaseUseCase<Response?, UploadParameters> {
  final BaseHomeRepository _baseHomeRepository ;

  UploadUseCases(this._baseHomeRepository);

  @override
  Future<({Failures? failures, Response? value})> call(UploadParameters parameters) async {
    // TODO: implement call
    return await _baseHomeRepository.uploadHomeData(parameters);
  }
}

class UploadParameters extends Equatable {
  final String title, desc, priority, dueDate, image;

  const UploadParameters({
    required this.title,
    required this.image,
    required this.desc,
    required this.priority ,
    required this.dueDate
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, desc, priority, dueDate, image];
}