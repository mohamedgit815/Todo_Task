import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_todo/App/Utils/route_builder.dart';
import 'package:task_todo/App/app.dart';



class MyApp extends ConsumerWidget {
  final Widget screen;

  const MyApp({
    super.key ,
    required this.screen
  });


  @override
  Widget build(BuildContext context , WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Commerce App' ,

      restorationScopeId: 'root' ,

      //navigatorKey: App.navigator.navigatorKey ,

      onGenerateRoute: RouteGenerators.onGenerate ,


      //routes: RouteGenerators.onGenerate ,
      //
      // themeMode: !ref.watch(App.theme.themeProvider).darkTheme ? ThemeMode.dark : ThemeMode.light,
      //
      // darkTheme: App.theme.darkThemeData() ,
      //
      themeMode: ThemeMode.light ,
       theme: App.theme.lightThemeData() ,

      home: screen ,


      /// Localization
      //locale: const Locale("ar") ,
      // locale: App.localization.switchLang(ref.watch(App.localization.provLang).value),
      //
      // supportedLocales: App.localization.supportedLocales() ,
      //
      // localizationsDelegates: App.localization.localizationsDelegates(),
      //
      // localeResolutionCallback: (Locale? currentLocal ,Iterable<Locale> supportedLocal) {
      //   return App.localization.localeResolutionCallback(currentLocal, supportedLocal);
      // } ,

    );
  }
}