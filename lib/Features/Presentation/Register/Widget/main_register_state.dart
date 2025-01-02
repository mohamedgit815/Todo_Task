import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/providers.dart';
import 'package:task_todo/App/Utils/route_builder.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Domain/UseCases/register_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Auth/auth_provider.dart';
import 'package:task_todo/Features/Presentation/Register/Widget/init_register.dart';


abstract class MainRegisterState {
  final registerPwProv = ChangeNotifierProvider((_)=> BooleanProvider());

  final controller = (
    name: TextEditingController(),
    phone: TextEditingController(),
    years: TextEditingController(),
    levels: TextEditingController(),
    address: TextEditingController(),
    password: TextEditingController(),
  );

  final List<String> level = ["fresh", "junior" , "midLevel" , "senior"];
}

abstract class BaseRegisterState extends MainRegisterState {

  Future<void> register({
    required WidgetRef ref,
    required BuildContext context,
    required InitRegister init,
    required FlutterSecureStorage secureStorage
  });

}

class RegisterState extends BaseRegisterState {

  @override
  Future<void> register({
    required WidgetRef ref,
    required BuildContext context,
    required InitRegister init,
    required FlutterSecureStorage secureStorage
  }) async {

    final RegisterParameters parameters = RegisterParameters(
        phone: init.main.controller.phone.text , /// Phone
        password: init.main.controller.password.text , /// PW
        name: init.main.controller.name.text ,
        years: init.main.controller.years.text ,
        level: init.main.controller.levels.text ,
        address: init.main.controller.address.text
    );

    final Response? response = await ref.read(registerNotifier(secureStorage).notifier).register(parameters);

    final ProvidersState states
    = await ref.read(registerNotifier(secureStorage));

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
          content: App.text.text(states.buttonErrMsg, context,color: Colors.white)));
    }

  }


}


