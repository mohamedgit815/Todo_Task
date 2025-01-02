import 'package:flutter/material.dart';
import 'package:task_todo/App/WidgetsHelper/Packages/animated_condidtional_builder.dart';
import 'package:task_todo/App/WidgetsHelper/Packages/responsive_builder.dart';
import 'package:task_todo/App/WidgetsHelper/Packages/shimmer.dart';

abstract class BasePackagesWidgets {
  /// Function App for Packages

  // Package ResponsiveBuilder
  ResponsiveBuilderScreen responsiveBuilderScreen({
    required Widget mobile ,
    Widget? tablet ,
    Widget? deskTop
  });


  ConditionalBuilder condition({
    required Duration duration ,
    required bool condition ,
    required WidgetBuilder builder ,
    required WidgetBuilder fallback
  });


  Widget shimmer({required Widget child});
}


class PackagesWidgets implements BasePackagesWidgets {

  @override
  ResponsiveBuilderScreen responsiveBuilderScreen({
    required Widget mobile ,
    Widget? tablet ,
    Widget? deskTop
  }) {
    return ResponsiveBuilderScreen(
      mobile: mobile ,
      tablet: tablet ?? mobile ,
      deskTop:deskTop ?? mobile ,
    );
  }


  @override
  ConditionalBuilder condition({
    required bool condition ,
    required WidgetBuilder builder ,
    required WidgetBuilder fallback ,
    required Duration duration
}) {
    // TODO: implement condition
    return ConditionalBuilder(
        condition: condition,
        builder: builder,
        fallback: fallback ,
        duration: duration ,
    );
  }

  @override
  Widget shimmer({required Widget child}) {
    // TODO: implement shimmer
    return ShimmerWidget(child: child);
  }

}