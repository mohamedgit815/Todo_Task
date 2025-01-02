import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Controller/Home/home_provider.dart';
import 'package:task_todo/Features/Presentation/Home/Screens/mobile_home_page.dart';
import 'package:task_todo/Features/Presentation/Home/Widget/init_home.dart';


class MainHomeScreen extends ConsumerStatefulWidget {
  final FlutterSecureStorage secureStorage;

  const MainHomeScreen({super.key, required this.secureStorage});

  @override
  ConsumerState<MainHomeScreen> createState() => _MainDriversScreenState();
}

class _MainDriversScreenState extends ConsumerState<MainHomeScreen> {

  late InitHome init;

  @override
  void initState() {
    super.initState();
    init = InitHome();

    Future.delayed(Duration.zero,() async {



      //if(ref.read(homeNotifier(widget.secureStorage)).data.isEmpty) {

        await ref.read(homeNotifier(widget.secureStorage).notifier).fetchHome(
            scrollController: init.main.scrollController,
            status: '' ,
        );

    });


  }


  @override
  Widget build(BuildContext context) {
    //final contextApp = App.contextApp.context(context);

    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileHomePage(init: init, secureStorage: widget.secureStorage) ,
        tablet: null ,
        deskTop: null
    );
  }
}