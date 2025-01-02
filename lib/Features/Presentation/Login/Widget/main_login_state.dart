import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/providers.dart';
import 'package:task_todo/App/Utils/route_builder.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Domain/UseCases/login_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Auth/auth_provider.dart';
import 'package:task_todo/Features/Presentation/Login/Widget/init_login.dart';




abstract class MainLoginState {
  final loginPwProv = ChangeNotifierProvider((_)=> BooleanProvider());

  final test = TextEditingController();
  final controller = (
      phone: TextEditingController() ,
      password: TextEditingController()
  );
}

abstract class BaseLoginState extends MainLoginState {
   navigateToRegister({required BuildContext context, required FlutterSecureStorage secureStorage});


  Future<void> login({
    required WidgetRef ref,
    required BuildContext context,
    required InitLogin init,
    required FlutterSecureStorage  secureStorage
  });


}

class LoginState extends BaseLoginState {

  @override
   navigateToRegister({required BuildContext context, required FlutterSecureStorage secureStorage}) {
    // TODO: implement navigateToRegister

     Navigator.of(context).pushNamed(RouteGenerators.registerScreen, arguments: [secureStorage]);

    // return App.navigator.pushNamedRouter(
    //     route: RouteGenerators.registerScreen,
    //     context: context ,
    //     arguments: [secureStorage]
    // );
  }

  @override
  Future<void> login({
    required WidgetRef ref,
    required BuildContext context,
    required InitLogin init,
    required FlutterSecureStorage  secureStorage
  }) async {
    final LoginParameters parameters = LoginParameters(
        phone: init.main.controller.phone.text , /// Phone
        password: init.main.controller.password.text /// PW
    );

    final Response? response =
    await ref.read(loginNotifier(secureStorage).notifier).login(parameters);

    final ProvidersState loginState = await ref.read(loginNotifier(secureStorage));

    if(response != null) {
      final data = response.data;

      await secureStorage.write(key: "id", value: data['_id'].toString());
      await secureStorage.write(key: "accessToken", value: data['access_token']);
      await secureStorage.write(key: "refreshToken", value: data['refresh_token']);

      //await App.profile.setSecureUserModel(secure: prefSecureStorage, response: response);

      //final UserEntities user = await App.profile.getSecureUserModel(secure: prefSecureStorage);

      if(context.mounted) {
        FocusScope.of(context).unfocus();
        Navigator.of(context).pushNamedAndRemoveUntil(RouteGenerators.homeScreen, (route) => false,arguments: [secureStorage]);
      }
    } else {
      if(!context.mounted) return;
      context.scaffoldState.showSnackBar(SnackBar(
          content: App.text.text(loginState.buttonErrMsg, context,color: Colors.white)));
    }

  }

}


