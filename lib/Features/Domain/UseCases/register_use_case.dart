import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/base_use_case.dart';
import 'package:task_todo/Features/Domain/Repository/base_auth_repository.dart';


class RegisterUseCase extends BaseUseCase<Response?, RegisterParameters> {

  final BaseAuthRepository _baseAuthRepository;

  RegisterUseCase(this._baseAuthRepository);

  @override
  Future<({Failures? failures, Response? value})> call(RegisterParameters parameters) async {
    // TODO: implement call
    return await _baseAuthRepository.register(parameters);
  }

}


class RegisterParameters extends Equatable {
  final String name, phone, password, years, level, address;

  const RegisterParameters({
    required this.phone,
    required this.password ,
    required this.name,
    required this.years,
    required this.level,
    required this.address
  });

  @override
  // TODO: implement props
  List<Object?> get props => [phone, password, name, years, level, address];
}