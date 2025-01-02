import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Repository/base_auth_repository.dart';

class LogOutUseCase extends BaseUseCase<Response?, LogOutParameters> {

  final BaseAuthRepository _baseAuthRepository;

  LogOutUseCase(this._baseAuthRepository);

  @override
  Future<({Failures? failures, Response? value})> call(LogOutParameters parameters) async {
    // TODO: implement call
    return await _baseAuthRepository.logout(parameters);
  }

}


class LogOutParameters extends Equatable {
  final String refreshToken;

  const LogOutParameters({
    required this.refreshToken,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [refreshToken];
}