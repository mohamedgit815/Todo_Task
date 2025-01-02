import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Domain/Repository/base_home_repository.dart';


class DetailsHomeUseCases extends BaseUseCase<HomeEntities?, DetailsHomeParameters> {
  final BaseHomeRepository _baseHomeRepository ;

  DetailsHomeUseCases(this._baseHomeRepository);

  @override
  Future<({Failures? failures, HomeEntities? value})> call(DetailsHomeParameters parameters) async {
    // TODO: implement call
    return await _baseHomeRepository.getDetailsHomeData(parameters);
  }
}

class DetailsHomeParameters extends Equatable {
  final String id;

  const DetailsHomeParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}