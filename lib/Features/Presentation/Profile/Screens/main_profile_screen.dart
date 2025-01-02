import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/profile_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Auth/auth_provider.dart';
import 'package:task_todo/Features/Presentation/Profile/Screens/mobile_profile_page.dart';
import 'package:task_todo/Features/Presentation/Profile/Widget/init_profile.dart';


class MainProfileScreen extends ConsumerStatefulWidget {
  final FlutterSecureStorage secureStorage;

  const MainProfileScreen({super.key, required this.secureStorage});

  @override
  ConsumerState<MainProfileScreen> createState() => _MainDriversScreenState();
}

class _MainDriversScreenState extends ConsumerState<MainProfileScreen> {

  late InitProfile init;
  UserEntities model = const UserEntities(
      id: "", name: "", phone: "", address: "",
      level: "", years: 1, createdAt: '', updatedAt: ""
  );

  @override
  void initState() {
    super.initState();
    init = InitProfile();

    Future.delayed(Duration.zero,() async {

      if(ref.read(profileNotifier(widget.secureStorage)).data.isEmpty) {

        final String? id = await widget.secureStorage.read(key: 'id');

        await ref.read(
            profileNotifier(widget.secureStorage).notifier).profile(
            ProfileParameters(id: id.toString())
        );

      }

    });
  }




  @override
  Widget build(BuildContext context) {


    final UserEntities? provider = ref.watch(profileNotifier(widget.secureStorage)).singleData;
    model = provider ?? model;

    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileProfilePage(
            init: init,
            secureStorage: widget.secureStorage ,
            model: model,
        ) ,

        tablet: null ,
        deskTop: null
    );
  }
}