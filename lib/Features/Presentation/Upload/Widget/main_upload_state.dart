import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/providers.dart';
import 'package:task_todo/App/Utils/route_builder.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Domain/UseCases/upload_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Home/home_provider.dart';
import 'package:task_todo/Features/Presentation/Upload/Widget/init_upload.dart';


abstract class MainUploadState {
  final List<String> priority = ['low' , 'medium' , 'high'];
  DateTime? dueDate;
  final imageProv = ChangeNotifierProvider((ref)=> ImagePickerProvider());

  var controller = (
    title: TextEditingController() ,
    desc: TextEditingController() ,
    priority: TextEditingController() ,
  );
}

abstract class BaseUploadState extends MainUploadState {
  Future<void> uploadTasks({
    required BuildContext context ,
    required WidgetRef ref,
    required InitUpload init ,
    required FlutterSecureStorage prefSecureStorage ,
  });
}

class UploadState extends BaseUploadState {


  @override
  Future<void> uploadTasks({
    required BuildContext context ,
    required WidgetRef ref,
    required InitUpload init ,
    required FlutterSecureStorage prefSecureStorage ,
  }) async {


    final UploadParameters parameters = UploadParameters(
        title: init.main.controller.title.text ,
        desc: init.main.controller.desc.text ,
        priority: init.main.controller.priority.text,
        dueDate: init.main.dueDate.toString().substring(0,10),
        image: ref.read(init.main.imageProv).fileImage?.path ?? "path.png"

    );
    final Response? response =
    await ref.read(uploadNotifier(prefSecureStorage).notifier).upload(parameters);
    final ProvidersState state = await ref.read(uploadNotifier(prefSecureStorage));
    if(response != null)  {

      if(context.mounted) {

        await Navigator.of(context).pushNamedAndRemoveUntil(
            RouteGenerators.homeScreen, (route) => false,
            arguments: [prefSecureStorage]
        );

      }

    } else {
      if(!context.mounted) return;
      context.scaffoldState.showSnackBar(SnackBar(
          content: App.text.text(state.buttonErrMsg, context,color: Colors.white)));
    }

  }
}


