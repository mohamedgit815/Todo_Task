import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/enums.dart';
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/login_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/logout_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/profile_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/register_use_case.dart';


class AuthNotifier extends StateNotifier<ProvidersState> {

  LoginUseCase? _loginUseCase;
  RegisterUseCase? _registerUseCase;
  LogOutUseCase? _logOutUseCase;
  ProfileUseCase? _profileUseCase;

  AuthNotifier({
    LoginUseCase? loginUseCase ,
    RegisterUseCase? registerUseCase ,
    LogOutUseCase? logOutUseCase ,
    ProfileUseCase? profileUseCase ,
  }) : super(const ProvidersState()) {
    _loginUseCase = loginUseCase;
    _registerUseCase = registerUseCase;
    _logOutUseCase = logOutUseCase;
    _profileUseCase = profileUseCase;
  }

  Future<Response?> login(LoginParameters params) async {

    state = state.copyWith(buttonState: RequestsState.loading);

    final ({Failures? failures, Response<dynamic>? value}) result = await _loginUseCase!.call(params);

    if(result.value != null) {


      state = state.copyWith(buttonState: RequestsState.success);

    } else {

      state = state.copyWith(
          buttonState: result.failures!.local == true ? RequestsState.local : RequestsState.failure ,
          buttonErrMsg: result.failures!.msg
      );

    }
    return result.value;
  }

  Future<Response?> register(RegisterParameters params) async {

    state = state.copyWith(buttonState: RequestsState.loading);

    final ({Failures? failures, Response<dynamic>? value}) result = await _registerUseCase!.call(params);
    if(result.value != null) {

      state = state.copyWith(buttonState: RequestsState.success);

    } else {
      if(result.failures!.local == true) {

        state = state.copyWith(
            buttonState: RequestsState.local ,
            buttonErrMsg: result.failures!.msg
        );

      } else {

        state = state.copyWith(
            buttonState: RequestsState.failure ,
            buttonErrMsg: result.failures!.msg
        );

      }
    }
    return result.value;
  }

  Future<Response?> logOut(LogOutParameters params) async {

    state = state.copyWith(buttonState: RequestsState.loading);

    final ({Failures? failures, Response<dynamic>? value}) result = await _logOutUseCase!.call(params);

    if(result.value != null) {

      state = state.copyWith(buttonState: RequestsState.success);

    } else {
      
      state = state.copyWith(
          buttonState: result.failures!.local ? RequestsState.local : RequestsState.failure ,
          buttonErrMsg: result.failures!.msg
      );

    }
    return result.value;
  }

  Future<UserEntities?> profile(ProfileParameters params) async {

    state = state.copyWith(singleState: RequestsState.loading);

    ({Failures? failures, UserEntities? value}) result = await _profileUseCase!.call(params);

    if(result.failures == null ) {

      state = state.copyWith(
        singleData: result.value ,
        singleState: RequestsState.success ,
      );


    } else {
      if(result.failures!.local) {
        state = state.copyWith(
            singleState: RequestsState.local ,
            singleErrorMsg: result.failures?.msg
        );
      } else {
        state = state.copyWith(
            singleState: RequestsState.failure ,
            singleErrorMsg: result.failures?.msg
        );
      }
    }
    return result.value;

  }

}