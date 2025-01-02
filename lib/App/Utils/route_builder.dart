import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_todo/Features/Presentation/Details/Screens/main_details_screen.dart';
import 'package:task_todo/Features/Presentation/Home/Screens/main_home_screen.dart';
import 'package:task_todo/Features/Presentation/Login/Screens/main_login_screen.dart';
import 'package:task_todo/Features/Presentation/Profile/Screens/main_profile_screen.dart';
import 'package:task_todo/Features/Presentation/Register/Screens/main_register_screen.dart';
import 'package:task_todo/Features/Presentation/Upload/Screens/main_upload_screen.dart';

class RouteGenerators {
   static const String loginScreen = '/MainLoginScreen';
   static const String registerScreen = '/MainRegisterScreen';
   static const String homeScreen = '/MainHomeScreen';
   static const String profileScreen = '/MainProfileScreen';
   static const String uploadScreen = '/MainUploadScreen';
   static const String detailsScreen = '/MainDetailsScreen';

  static MaterialPageRoute<dynamic> _materialPageRoute(Widget page) {
    return MaterialPageRoute( builder: ( _ ) => page );
  }

  static CupertinoPageRoute<dynamic> _cupertinoPageRoute(Widget page) {
    return CupertinoPageRoute( builder: ( _ ) => page );
  }


  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch(settings.name) {

      case loginScreen:
        final List<dynamic> data = settings.arguments as List<dynamic>;
        return _materialPageRoute(MainLoginScreen(secureStorage: data.elementAt(0)));

        case registerScreen:
        final List<dynamic> data = settings.arguments as List<dynamic>;
        return _cupertinoPageRoute(MainRegisterScreen(secureStorage: data.elementAt(0)));


        case homeScreen:
          final List<dynamic> data = settings.arguments as List<dynamic>;
        return _materialPageRoute(MainHomeScreen(secureStorage: data.elementAt(0)));

        case profileScreen:
          final List<dynamic> data = settings.arguments as List<dynamic>;
          return _cupertinoPageRoute(MainProfileScreen(secureStorage: data.elementAt(0)));


      case uploadScreen:
        final List<dynamic> data = settings.arguments as List<dynamic>;
        return _cupertinoPageRoute(MainUploadScreen(secureStorage: data.elementAt(0)));


      case detailsScreen:
        final List<dynamic> data = settings.arguments as List<dynamic>;
        return _cupertinoPageRoute(MainDetailsScreen(
          secureStorage: data.elementAt(0),
          id: data.elementAt(1),
          initHome: data.elementAt(2),
          index: data.elementAt(3)
        ));

    }


    return null;
  }

}