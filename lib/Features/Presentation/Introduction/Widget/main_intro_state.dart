import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/Utils/route_builder.dart';


abstract class MainIntroState {}

abstract class BaseIntroState extends MainIntroState {
  Future<void> navigateToLogin({
    required BuildContext context, required FlutterSecureStorage secureStorage
  });
}

class IntroState extends BaseIntroState {
  @override
  Future<void> navigateToLogin({
    required BuildContext context, required FlutterSecureStorage secureStorage
  }) async {
    await Navigator.of(context).pushNamed(RouteGenerators.loginScreen, arguments: [secureStorage]);
  }
}


