import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Repository/base_auth_repository.dart';


class LoginUseCase extends BaseUseCase<Response?, LoginParameters> {

  final BaseAuthRepository _baseAuthRepository;

  LoginUseCase(this._baseAuthRepository);

  @override
  Future<({Failures? failures, Response? value})> call(LoginParameters parameters) async {
    // TODO: implement call
    return await _baseAuthRepository.login(parameters);
  }

}


class LoginParameters extends Equatable {
  final String phone, password;

  const LoginParameters({required this.phone, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [phone, password];
}