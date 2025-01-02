// import 'package:e_commerce_system/App/app.dart';
// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';
//
// class TimeLineWidget extends StatelessWidget {
//   final double height;
//   final bool isFirst, isLast, isPast;
//   final Widget child;
//   const TimeLineWidget({super.key, required this.height, required this.isFirst, required this.isLast, required this.isPast, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     final color = isPast ? App.color.lightMain : App.color.lightMain.withOpacity(0.4);
//     return SizedBox(
//       height: height ,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: TimelineTile(
//           isFirst: isFirst ,
//           isLast: isLast ,
//           beforeLineStyle: LineStyle(color: color) ,
//           indicatorStyle: IndicatorStyle(
//             color: color ,
//             width: 40.0 ,
//             iconStyle: !isPast ? null : IconStyle(iconData: Icons.done ,
//                 color: isPast ? App.color.helperWhite : App.color.lightMain.withOpacity(0.2)) ,
//           ),
//           endChild: Container(
//              margin: const EdgeInsets.all(25.0) ,
//             decoration: BoxDecoration(
//               color: color ,
//               borderRadius: BorderRadius.circular(10.0) ,
//             ),
//             child: Center(child: child)
//           ) ,
//         ),
//       ),
//     );
//   }
// }
