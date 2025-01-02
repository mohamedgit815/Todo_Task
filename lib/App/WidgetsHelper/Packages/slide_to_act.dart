// import 'package:flutter/material.dart';
//
// class SlideToActWidget extends StatelessWidget {
//   final dynamic onPressed;
//   final bool? reversed, rotate;
//   final Widget? icon;
//   final String? text;
//
//   const SlideToActWidget({
//     super.key ,
//     required this.onPressed ,
//     required this.reversed ,
//     required this.icon ,
//     required this.text ,
//     required this.rotate
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SlideAction(
//       borderRadius: 15.0,
//       elevation: 0 ,
//       reversed: reversed ?? false ,
//       innerColor: App.theme.conditionTheme(
//           context: context,
//           light: App.color.lightMain,
//           dark: App.color.darkMain
//       ),
//       outerColor: App.theme.conditionTheme(
//         context: context,
//         light: App.color.lightMain.withOpacity(0.5),
//         dark: App.color.darkMain.withOpacity(0.5),
//       ),
//       text: text ?? '${App.localization.translate(context: context, text: LangEnum.slideToSubmit.name)}',
//       sliderButtonIcon: icon ?? const Icon(Icons.lock,size: 17.0,color: Colors.white,),
//       sliderRotate: rotate ?? true,
//       onSubmit: onPressed
//     );
//   }
// }
