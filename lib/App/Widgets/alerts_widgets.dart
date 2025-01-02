import 'package:flutter/material.dart';
import 'package:task_todo/App/Utils/enums.dart';
import 'package:task_todo/App/app.dart';


abstract class BaseAlertWidgets {
  ScaffoldMessengerState snackBar({
    required String text,
    required BuildContext context ,
    final BorderRadius? borderRadius ,
    final EdgeInsets? padding ,
    final Duration? duration ,
    final SnackBarAction? snackBarAction ,
    final bool translate
  });

  Future<void> showAlertDialog({
    required BuildContext context ,
    required Widget Function(BuildContext) builder
  });

  Future<void> globalAlertDialog({
    required VoidCallback onPressed ,
    required BuildContext context  ,
    Widget? content
  });

  Future<void> modalBottomSheet({
    required Widget widgets ,
    required BuildContext context
  });

  ScaffoldMessengerState materialBanner({
    required BuildContext context ,
    required String text ,
    required List<Widget> actions ,
    Widget? leading
  });
}


class AlertWidgets implements BaseAlertWidgets {
  @override
  ScaffoldMessengerState snackBar({
    required String text,
    required BuildContext context ,
    final BorderRadius? borderRadius ,
    final EdgeInsets? padding ,
    final Duration? duration ,
    final SnackBarAction? snackBarAction ,
    final bool translate = true
  }) {
    final Color color = App.color.helperWhite;
    return ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
        SnackBar(
            content: translate ? App.text.translateText(text, context, color: color) : App.text.text(text, context,color: color) ,
            //content: App.text.text(text, context),
            shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(0.0)),
            padding: padding ,
            duration: duration ?? const Duration(seconds: 1) ,
            action: snackBarAction
        ));
  }

  @override
  Future<void> globalAlertDialog({
    required VoidCallback onPressed ,
    required BuildContext context ,
    Widget? content
  }) async {
    return await showDialog(context: context, builder: (buildContext)=>AlertDialog(
      title: App.text.translateText(LangEnum.areUSure.name,context) ,
      content: content ,
      actions: [
        App.buttons.elevated(
          borderRadius: BorderRadius.circular(10.0),
            onPressed: (){
              Navigator.maybePop(context);
            }, child: App.text.translateText(LangEnum.no.name, context,color: Colors.white)),
        App.buttons.elevated(
            borderRadius: BorderRadius.circular(10.0),
            onPressed: onPressed, child: App.text.translateText(LangEnum.yes.name, context,color: Colors.white)),
      ],
    ));
  }

  @override
  Future<void> showAlertDialog({
    required BuildContext context ,
    required Widget Function(BuildContext) builder
  })
  async {
    return await showAdaptiveDialog(context: context, builder: builder);
  }


  @override
  Future<void> modalBottomSheet({
    required Widget widgets ,
    required BuildContext context
  }) async {
    return await showModalBottomSheet(context: context, builder: (buildContext)=>widgets);
  }


  @override
  ScaffoldMessengerState materialBanner({
    required BuildContext context ,
    required String text ,
    required List<Widget> actions ,
    Widget? leading
  }) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(MaterialBanner(
          leading: leading ,
          content: Text(text) ,
          actions: actions
      ));
  }

}
