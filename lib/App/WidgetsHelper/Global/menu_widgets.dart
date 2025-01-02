// import 'package:flutter/material.dart';
//
// class CustomMenuWidgets extends StatelessWidget {
//   final TextEditingController controller;
//   final List<DropdownMenuEntry> dropdownMenuEntries;
//   final void Function(dynamic)? onSelected;
//   final double? width;
//
//   const CustomMenuWidgets({
//     super.key,
//     required this.controller ,
//     required this.dropdownMenuEntries ,
//     this.onSelected,
//     this.width
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu(
//       width: width ?? context.width * 0.9,
//       dropdownMenuEntries: dropdownMenuEntries ,
//         onSelected: onSelected ,
//         controller: controller ,
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true ,
//           fillColor: context.isDark ? App.color.darkFirst : Colors.white ,
//             border: UnderlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0) ,
//                 borderSide: BorderSide.none
//             )
//         ),
//     );
//   }
// }
