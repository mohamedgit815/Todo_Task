import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/Features/Data/DataSource/auth_data_source.dart';
import 'package:task_todo/Features/Data/Repository/auth_repository.dart';
import 'package:task_todo/Features/Domain/UseCases/login_use_case.dart';
import 'package:task_todo/Features/Domain/Repository/base_auth_repository.dart';
import 'package:task_todo/Features/Domain/UseCases/logout_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/profile_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/register_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Auth/auth_notifier.dart';



final _dataSource = Provider
    .family<BaseAuthDataSource,FlutterSecureStorage>((ref,storage) {
  return AuthDataSource(secureStorage: storage);
});


final _repository = Provider
    .family<BaseAuthRepository,FlutterSecureStorage>((ref,storage) {
  return AuthRepository(ref.read(_dataSource(storage)));
});



final _loginUseCase = Provider
    .family<LoginUseCase,FlutterSecureStorage>((ref,storage) {
  return LoginUseCase(ref.read(_repository(storage)));
});


final _registerUseCase = Provider
    .family<RegisterUseCase,FlutterSecureStorage>((ref,storage) {
  return RegisterUseCase(ref.read(_repository(storage)));
});

final _logoutUseCase = Provider
    .family<LogOutUseCase,FlutterSecureStorage>((ref,storage) {
  return LogOutUseCase(ref.read(_repository(storage)));
});


final _userUseCase = Provider
    .family<ProfileUseCase,FlutterSecureStorage>((ref,storage) {
  return ProfileUseCase(ref.read(_repository(storage)));
});


final loginNotifier = StateNotifierProvider
    .family<AuthNotifier , ProvidersState, FlutterSecureStorage>((ref,storage) {
  return AuthNotifier(loginUseCase: ref.read(_loginUseCase(storage)));
});



final registerNotifier = StateNotifierProvider
    .family<AuthNotifier , ProvidersState, FlutterSecureStorage>((ref, storage) {
  return AuthNotifier(registerUseCase: ref.read(_registerUseCase(storage)));
});

final logoutNotifier = StateNotifierProvider
    .family<AuthNotifier , ProvidersState, FlutterSecureStorage>((ref, storage) {
  return AuthNotifier(logOutUseCase: ref.read(_logoutUseCase(storage)));
});


final profileNotifier = StateNotifierProvider
    .family<AuthNotifier , ProvidersState, FlutterSecureStorage>((ref, storage) {
  return AuthNotifier(profileUseCase: ref.read(_userUseCase(storage)));
});

