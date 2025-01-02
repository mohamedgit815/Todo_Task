import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Login/Screens/mobile_login_page.dart';
import 'package:task_todo/Features/Presentation/Login/Widget/init_login.dart';


class MainLoginScreen extends ConsumerStatefulWidget {
  final FlutterSecureStorage secureStorage;

  const MainLoginScreen({super.key, required this.secureStorage});

  @override
  ConsumerState<MainLoginScreen> createState() => _MainDriversScreenState();
}

class _MainDriversScreenState extends ConsumerState<MainLoginScreen> {

  late InitLogin init;

  @override
  void initState() {
    super.initState();
    init = InitLogin();
  }




  @override
  Widget build(BuildContext context) {
    //final contextApp = App.contextApp.context(context);

    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileLoginPage(init: init, secureStorage: widget.secureStorage) ,
        tablet: null ,
        deskTop: null
    );
  }
}