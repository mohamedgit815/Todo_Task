import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Introduction/Screens/mobile_intro_page.dart';
import 'package:task_todo/Features/Presentation/Introduction/Widget/init_intro.dart';


class MainIntroScreen extends ConsumerStatefulWidget {
  final FlutterSecureStorage secureStorage;
  const MainIntroScreen({super.key, required this.secureStorage});

  @override
  ConsumerState<MainIntroScreen> createState() => _MainDriversScreenState();
}

class _MainDriversScreenState extends ConsumerState<MainIntroScreen> {

  late InitIntro init;

  @override
  void initState() {
    super.initState();
    init = InitIntro();
  }




  @override
  Widget build(BuildContext context) {
    //final contextApp = App.contextApp.context(context);

    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileIntroPage(init: init, secureStorage: widget.secureStorage) ,
        tablet: null ,
        deskTop: null
    );
  }
}