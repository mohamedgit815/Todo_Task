import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';
import 'package:task_todo/Features/Domain/Repository/base_auth_repository.dart';


class ProfileUseCase extends BaseUseCase<UserEntities?, ProfileParameters> {

  final BaseAuthRepository _baseAuthRepository;

  ProfileUseCase(this._baseAuthRepository);

  @override
  Future<({Failures? failures, UserEntities? value})> call(ProfileParameters parameters) async {
    // TODO: implement call
    return await _baseAuthRepository.profile(parameters);
  }

}


class ProfileParameters extends Equatable {
  final String id;

  const ProfileParameters({
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}