import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Register/Screens/mobile_register_page.dart';
import 'package:task_todo/Features/Presentation/Register/Widget/init_register.dart';


class MainRegisterScreen extends ConsumerStatefulWidget {
  final FlutterSecureStorage secureStorage;
  const MainRegisterScreen({super.key, required this.secureStorage});

  @override
  ConsumerState<MainRegisterScreen> createState() => _MainDriversScreenState();
}

class _MainDriversScreenState extends ConsumerState<MainRegisterScreen> {

  late InitRegister init;

  @override
  void initState() {
    super.initState();
    init = InitRegister();
  }




  @override
  Widget build(BuildContext context) {
    //final contextApp = App.contextApp.context(context);

    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileRegisterPage(init: init, secureStorage: widget.secureStorage) ,
        tablet: null ,
        deskTop: null
    );
  }
}