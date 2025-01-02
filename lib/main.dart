import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/Utils/my_app.dart';
import 'package:task_todo/Features/Presentation/Home/Screens/main_home_screen.dart';
import 'package:task_todo/Features/Presentation/Introduction/Screens/main_intro_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await dotenv.load(fileName: '.env');

  const FlutterSecureStorage secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true)
  );


  late Widget screen;
  final String? id = await secureStorage.read(key: 'id');
  final String? accessToken = await secureStorage.read(key: 'accessToken');
  final String? refreshToken = await secureStorage.read(key: 'refreshToken');
  //await secureStorage.deleteAll();

  if(id != null && accessToken != null && refreshToken != null) {
    screen = const MainHomeScreen(secureStorage: secureStorage);
  } else {
    screen = const MainIntroScreen(secureStorage: secureStorage);
  }

  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp( ProviderScope(child: MyApp(
      screen: screen
  )));

}