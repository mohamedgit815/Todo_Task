import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Upload/Screens/mobile_upload_page.dart';
import 'package:task_todo/Features/Presentation/Upload/Widget/init_upload.dart';


class MainUploadScreen extends ConsumerStatefulWidget {
  final FlutterSecureStorage secureStorage;
  const MainUploadScreen({super.key, required this.secureStorage});

  @override
  ConsumerState<MainUploadScreen> createState() => _MainDriversScreenState();
}

class _MainDriversScreenState extends ConsumerState<MainUploadScreen> {

  late InitUpload init;

  @override
  void initState() {
    super.initState();
    init = InitUpload();
  }




  @override
  Widget build(BuildContext context) {
    //final contextApp = App.contextApp.context(context);

    return App.packageWidgets.responsiveBuilderScreen(
        mobile: MobileUploadPage(init: init, secureStorage: widget.secureStorage) ,
        tablet: null ,
        deskTop: null
    );
  }
}