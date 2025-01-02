import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_todo/App/WidgetsHelper/Global/auth_text_feild.dart';



abstract class BaseGlobalWidgets {
  Row expanded({required Widget child, int? flex});

  Widget loadingWidget({bool? parent});

  Widget authFormField({
    required TextInputAction inputAction ,
    required TextInputType inputType ,
    required BuildContext context ,
    required TextEditingController controller ,
    List<TextInputFormatter>? inputFormatter ,
    FormFieldValidator<String>? validator ,
    ValueChanged<String>? onSubmitted ,
    Widget? suffixIcon, Widget? prefixIcon ,
    VoidCallback? onTap ,
    String? hint ,
    int? maxLines ,
    bool? password ,
    bool? phone ,
    bool? enabled ,
    bool? autofocus ,
  });

}



class GlobalWidgets extends BaseGlobalWidgets {

  @override
  Row expanded({required Widget child, int? flex}) {
    return Row(
      children: [

        const Spacer(flex: 1,),

        Expanded(
            flex: flex ?? 12,
            child: child
        ),

        const Spacer(flex: 1,),
      ],
    );
  }

  @override
  Widget loadingWidget({bool? parent}) {
    bool value = parent ?? false;
    if(value == true){
      return const Scaffold(body: CircularProgressIndicator.adaptive());
    } else {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
  }



  @override
  Widget authFormField({
    required TextInputAction inputAction ,
    required TextInputType inputType ,
    required BuildContext context ,
    required TextEditingController controller,
    List<TextInputFormatter>? inputFormatter ,
    FormFieldValidator<String>? validator ,
    ValueChanged<String>? onSubmitted ,
    Widget? suffixIcon, Widget? prefixIcon ,
    VoidCallback? onTap ,
    String? hint ,
    int? maxLines ,
    bool? password ,
    bool? phone ,
    bool? enabled ,
    bool? autofocus  ,
  }) {
    return expanded(
      child: AuthTextField(
          controller: controller ,
          inputAction: inputAction ,
          inputType: inputType ,
          validator: validator ,
          password: password ,
          onSubmitted: onSubmitted ,
          hint: hint ,
          maxLines: maxLines ,
          prefixIcon: prefixIcon ,
          suffixIcon: suffixIcon ,
          inputFormatter: inputFormatter,
          phone: phone ?? true ,
          onTap: onTap ,
          enabled: enabled ,
          autofocus: autofocus ,
      ),
    );
  }
}