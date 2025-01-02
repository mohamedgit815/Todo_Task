import 'package:country_code_text_field/country_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_todo/App/app.dart';


class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon, prefixIcon;
  final String? hint;
  final bool? password , phone, enabled;
  final VoidCallback? onTap;
  final bool? autofocus;
  final int? maxLines;


  const AuthTextField({
    super.key ,
    required this.controller ,
    required this.inputAction ,
    required this.inputType ,
    this.onTap ,
    this.phone = true ,
    this.inputFormatter ,
    this.validator ,
    this.onSubmitted ,
    this.prefixIcon ,
    this.suffixIcon ,
    this.password ,
    this.enabled ,
    this.autofocus ,
    this.maxLines ,
    this.hint
  });

  @override
  Widget build(BuildContext context) {

    final OutlineInputBorder outlineInputBorder
    = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0) ,
        borderSide: BorderSide(
            //color: App.color.helperTransparent,
            color: App.color.helperGrey300,
            width: 3.0
        )
    );

    if(phone ?? true) {
      return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: inputType,
        textInputAction: inputAction,
        onFieldSubmitted: onSubmitted,
        onTap: onTap ,
        autofocus: autofocus ?? false ,
        maxLines: maxLines ,
        
        enabled: enabled ?? true ,
        style: TextStyle(color: App.theme.conditionTheme(
            context: context,
            light: App.color.helperBlack,
            dark: App.color.helperWhite
        ) ),
        cursorColor: App.theme.conditionTheme(
            context: context,
            light: App.color.lightMain,
            dark: App.color.darkMain
        ) ,
        inputFormatters: inputFormatter,
        obscureText: password ?? false,
        textDirection: App.global.directionText(controller.text),
        decoration: InputDecoration(
            hintText: hint ,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true ,
            fillColor: App.theme.conditionTheme(
                context: context,
                light: App.color.helperWhite,
                dark: App.color.darkFirst
            ),
            prefixIcon: prefixIcon ,
            suffixIcon: suffixIcon ,
            focusedBorder: outlineInputBorder ,
            errorBorder: outlineInputBorder ,
            disabledBorder: outlineInputBorder ,
            enabledBorder: outlineInputBorder ,
            focusedErrorBorder: outlineInputBorder
        ),
      );
    } else {
      return CountryCodeTextField(
        controller: controller,
        autofocus: false ,
        keyboardType: inputType,
        textInputAction: inputAction,
        onSubmitted: onSubmitted,
        backgroundColor: Colors.teal ,
        style: TextStyle(color: App.theme.conditionTheme(
            context: context,
            light: App.color.helperBlack,
            dark: App.color.helperWhite
        ) ) ,
        countryCodeTextStyle: TextStyle(color: App.theme.conditionTheme(
            context: context,
            light: App.color.helperBlack,
            dark: App.color.helperWhite
        ) ),
        cursorColor: App.theme.conditionTheme(
            context: context,
            light: App.color.lightMain,
            dark: App.color.darkMain
        ) ,
        inputFormatters: inputFormatter,
        initialCountryCode: "EG",
        decoration: InputDecoration(
            hintText: hint ,
            filled: true,
            fillColor: App.theme.conditionTheme(
                context: context,
                light: App.color.helperWhite,
                dark: App.color.darkFirst
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder ,
            focusedErrorBorder: outlineInputBorder
        ),
      );
    }
  }
}
