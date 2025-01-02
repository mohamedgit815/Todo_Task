import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/providers.dart';
import 'package:task_todo/App/Utils/route_builder.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/delete_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/logout_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Auth/auth_provider.dart';
import 'package:task_todo/Features/Presentation/Controller/Home/home_provider.dart';
import 'package:task_todo/Features/Presentation/Home/Widget/init_home.dart';



abstract class MainHomeState {
  final ScrollController scrollController = ScrollController();
  final scrollProv = ChangeNotifierProvider((ref) => BooleanProvider());
  final List<dynamic> chooseData = ['All', 'Waiting', "InProgress", "Finished"];
}

abstract class BaseHomeState extends MainHomeState {

  navigateToProfile({
    required BuildContext context ,
    required FlutterSecureStorage secureStorage
  });

  navigateToUpload({
    required BuildContext context ,
    required FlutterSecureStorage secureStorage
  });

  navigateToDetails({
    required BuildContext context ,
    required String id ,
    required int index ,
    required InitHome initHome ,
    required FlutterSecureStorage secureStorage
  });


  Future<void> logOut({
    required WidgetRef ref ,
    required BuildContext context ,
    required FlutterSecureStorage  secureStorage
  });

  Future<void> deleteItem({
    required WidgetRef ref,
    required HomeEntities model,
    required int index ,
    required BuildContext context,
    required FlutterSecureStorage  secureStorage
  });

  Color status(HomeEntities model);

  Color subStatus(HomeEntities model);

  Color priority(HomeEntities model);
}

class HomeState extends BaseHomeState {

  @override
  Future<void> logOut({
    required WidgetRef ref,
    required BuildContext context,
    required FlutterSecureStorage  secureStorage
  }) async {
    final String? refreshToken = await secureStorage.read(key: 'refreshToken');
    if(refreshToken == null) return;
    final LogOutParameters parameters = LogOutParameters(
      refreshToken: refreshToken
    );

    final Response? response =
    await ref.read(logoutNotifier(secureStorage).notifier).logOut(parameters);
    final ProvidersState states = await ref.read(logoutNotifier(secureStorage));

    if(response != null) {
      await secureStorage.deleteAll();

      if(context.mounted) {
        FocusScope.of(context).unfocus();
        await Navigator.of(context).pushNamedAndRemoveUntil(
            RouteGenerators.loginScreen, (route) => false , arguments: [secureStorage]
        );
      }

    } else {
      if(!context.mounted) return;
      context.scaffoldState.showSnackBar(SnackBar(
          content: App.text.text(states.buttonErrMsg, context,color: Colors.white)));
    }
  }

  @override
  Future<void> deleteItem({
    required WidgetRef ref ,
    required HomeEntities model ,
    required int index ,
    required BuildContext context ,
    required FlutterSecureStorage  secureStorage
  }) async {

    final DeleteHomeParameters parameters = DeleteHomeParameters(
      id: model.id ,
    );

    final Response? response =
    await ref.read(deleteNotifier(secureStorage).notifier).delete(parameters);
    final ProvidersState states = await ref.read(deleteNotifier(secureStorage));

    if(response != null)  {

      if(context.mounted) {
        FocusScope.of(context).unfocus();
        ref.read(homeNotifier(secureStorage).notifier).removeItem(index);
        Navigator.of(context).pop();
      }

    } else {
      if(!context.mounted) return;
      context.scaffoldState.showSnackBar(SnackBar(
          content: App.text.text(states.buttonErrMsg, context,color: Colors.white)));
    }

  }

  @override
  navigateToProfile({
    required BuildContext context,
    required FlutterSecureStorage secureStorage
  }) async {
    await Navigator.pushNamed(context, RouteGenerators.profileScreen, arguments: [secureStorage]);
  }


  @override
  navigateToDetails({
    required BuildContext context,
    required String id,
    required int index,
    required InitHome initHome,
    required FlutterSecureStorage secureStorage
  }) async {
    await Navigator.pushNamed(context, RouteGenerators.detailsScreen,
        arguments: [secureStorage, id, initHome, index]
    );
  }


  @override
  navigateToUpload({
    required BuildContext context,
    required FlutterSecureStorage secureStorage
  }) async {
    await Navigator.pushNamed(context, RouteGenerators.uploadScreen, arguments: [secureStorage]);
  }

  @override
  Color status(HomeEntities model) {
    if(model.status == "waiting") {
      return const Color(0xffFF7D53);
    } else if(model.status == "finished") {
      return const Color(0xff0087FF);
    } else {
      return const Color(0xff5F33E1);
    }
  }

  @override
  Color subStatus(HomeEntities model) {
   if(model.status == "waiting") {
     return const Color(0xffFFE4F2);
   } else if(model.status == "finished") {
     return const Color(0xffE3F2FF);
   } else {
     return const Color(0xffF0ECFF);
   }
  }

  @override
  Color priority(HomeEntities model) {
    if(model.priority == "high") {
      return const Color(0xffFF7D53);
    } else if(model.priority == "medium") {
      return const Color(0xff5F33E1);
    } else {
      return const Color(0xff0087FF);
    }
  }

}


