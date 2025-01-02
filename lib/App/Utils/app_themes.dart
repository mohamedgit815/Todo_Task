import 'package:flutter/material.dart';
import 'package:task_todo/App/app.dart';


abstract class BaseAppThemes {

  // ProviderListenable<PreferencesBooleanProvider> themeProvider =
  // ChangeNotifierProvider((ref) => PreferencesBooleanProvider(
  //     key: SecureStorageEnum.preferencesTheme.name
  // ));

  Color conditionTheme({
    required BuildContext context ,
    required Color light ,
    required Color dark
  });

  /// This is for Dark Theme
  ThemeData darkThemeData();

  /// This is for Light Theme
  ThemeData lightThemeData();
}

class AppThemes extends BaseAppThemes {

  @override
  Color conditionTheme({
    required BuildContext context ,
    required Color light ,
    required Color dark
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if(isDark) {
      return dark;
    } else {
      return light;
    }
  }


  @override
  ThemeData darkThemeData() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark ,
        primaryColor: App.color.darkMain ,
        primaryColorDark: App.color.darkMain ,
        scaffoldBackgroundColor: App.color.darkSecond ,
        canvasColor: App.color.darkMain ,
        highlightColor: App.color.darkMain.withOpacity(0.2),
        splashColor: App.color.darkMain.withOpacity(0.2),
        hoverColor: App.color.darkMain.withOpacity(0.2) ,
        disabledColor: App.color.darkMain.withOpacity(0.2) ,
        dividerColor: App.color.darkMain ,
        colorScheme: ColorScheme(
        brightness: Brightness.dark ,
        primary: App.color.darkMain ,
        onPrimary: Colors.white ,
        secondary: Colors.red ,
        onSecondary: Colors.red ,
        surface: App.color.whiteOne ,
        onSurface: App.color.whiteOne ,
        error: Colors.red ,
        onError: Colors.orange ,
      ) ,
        indicatorColor: Colors.red,

        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(App.color.darkFirst) ,
          )
        ),
        appBarTheme: AppBarTheme(
        backgroundColor: App.color.helperBlack ,
        foregroundColor: App.color.helperWhite ,
        elevation: 0 ,
        actionsIconTheme: IconThemeData(
            color: App.color.helperWhite ,
            size: 25.0
        ),
        iconTheme: IconThemeData(
            color: App.color.helperWhite ,
            size: 25.0
        ) ,
      ) ,
        bottomAppBarTheme: const BottomAppBarTheme() ,
        drawerTheme: DrawerThemeData(
          backgroundColor: App.color.darkFirst ,
          //scrimColor: App.color.genera.helperBlack.withOpacity(3.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)) ,
        ) ,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(App.color.darkMain) ,
            textStyle: WidgetStatePropertyAll(TextStyle(color: App.color.helperWhite)) ,
          )
        ),
        cardTheme: CardTheme(
          color: App.color.darkFirst
        ) ,
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(App.color.darkMain),
          trackColor: WidgetStatePropertyAll(App.color.helperWhite),
        ) ,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: App.color.darkFirst ,
          selectedItemColor: App.color.helperWhite ,
          unselectedItemColor: App.color.helperGrey600
          //selectedIconTheme: IconThemeData()
        ) ,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            refreshBackgroundColor: App.color.darkMain
        ) ,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: App.color.darkMain ,
          actionBackgroundColor: App.color.helperWhite
        )
    );
  }



  @override
  ThemeData lightThemeData() {
    return ThemeData(
        useMaterial3: true ,
        brightness: Brightness.light ,
        primaryColor: App.color.lightMain ,
        scaffoldBackgroundColor: const Color(0xffFFFFFF) ,
        canvasColor: App.color.lightMain ,
        highlightColor: App.color.lightMain.withOpacity(0.2),
        splashColor: App.color.lightMain.withOpacity(0.2) ,
        hoverColor: App.color.lightMain.withOpacity(0.2) ,
        disabledColor: App.color.lightMain.withOpacity(0.2) ,
        dividerColor: App.color.lightMain ,
        dialogBackgroundColor: App.color.helperWhite,
        unselectedWidgetColor: Colors.red, /// Test
        secondaryHeaderColor: Colors.red, /// Test


      /// Scaffold
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light
        ) ,

        dropdownMenuTheme: DropdownMenuThemeData(
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(App.color.helperWhite) ,
            )
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: App.color.helperWhite ,
            foregroundColor: App.color.helperBlack ,
            elevation: 0 ,
            actionsIconTheme: IconThemeData(
                color: App.color.helperWhite ,
                size: 25.0
            )
        ) ,
        actionIconTheme: const ActionIconThemeData(),
        drawerTheme: DrawerThemeData(
          backgroundColor: App.color.helperWhite ,
          elevation: 0 ,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        ) ,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(App.color.darkMain)
            )
        ),
        cardTheme: CardTheme(
            color: App.color.whiteOne
        ) ,
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(App.color.helperWhite),
          trackColor: WidgetStatePropertyAll(App.color.lightMain),
        ) ,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            refreshBackgroundColor: App.color.lightMain
          ) ,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: App.color.lightMain ,
            selectedItemColor: App.color.helperWhite ,
            unselectedItemColor: App.color.grey.shade400
          //selectedIconTheme: IconThemeData()
        ) ,
        snackBarTheme: SnackBarThemeData(
            backgroundColor: App.color.lightMain
        )
    );
  }

  /*
  dropdownMenuTheme: const DropdownMenuThemeData(),
  MenuBarThemeData? menuBarTheme,
  MenuButtonThemeData? menuButtonTheme,
  MenuThemeData? menuTheme,
  NavigationBarThemeData? navigationBarTheme,
  NavigationDrawerThemeData? navigationDrawerTheme,
  NavigationRailThemeData? navigationRailTheme,
  PopupMenuThemeData? popupMenuTheme,
  TextSelectionThemeData? textSelectionTheme,
  SegmentedButtonThemeData? segmentedButtonTheme,
  ToggleButtonsThemeData? toggleButtonsTheme,
*/
}