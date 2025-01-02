import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/details_home_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Home/home_provider.dart';
import 'package:task_todo/Features/Presentation/Details/Screens/mobile_details_page.dart';
import 'package:task_todo/Features/Presentation/Details/Widget/init_details.dart';
import 'package:task_todo/Features/Presentation/Home/Widget/init_home.dart';


class MainDetailsScreen extends ConsumerStatefulWidget {
  final FlutterSecureStorage secureStorage;
  final InitHome initHome;
  final String id;
  final int index;

  const MainDetailsScreen({
    super.key,
    required this.secureStorage,
    required this.initHome,
    required this.index,
    required this.id
  });

  @override
  ConsumerState<MainDetailsScreen> createState() => _MainDriversScreenState();
}

class _MainDriversScreenState extends ConsumerState<MainDetailsScreen> {

  late InitDetails init;
  HomeEntities model = const HomeEntities(
      id: "",
      title: "",
      image: "",
      desc: "",
      priority: "",
      status: "",
      user: "",
      createdAt: "",
      updatedAt: ""
  );

  @override
  void initState() {
    super.initState();
    init = InitDetails();

    Future.delayed(Duration.zero,() async {

     // if(ref.read(detailsHomeNotifier(widget.secureStorage)).data.isEmpty) {

        await ref.read(
            detailsHomeNotifier(widget.secureStorage).notifier).detailsHome(
          DetailsHomeParameters(id: widget.id)
        );

      //}

    });
  }




  @override
  Widget build(BuildContext context) {
    //final contextApp = App.contextApp.context(context);

    final HomeEntities? provider =
    ref.watch(detailsHomeNotifier(widget.secureStorage)).singleData;

    if(provider != null) {
      model = provider;
    }


    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileDetailsPage(
            init: init ,
            model: provider ?? model ,
            secureStorage: widget.secureStorage,
          initHome: widget.initHome,
            index: widget.index,
        ) ,
        tablet: null ,
        deskTop: null
    );
  }
}