import 'package:flutter/material.dart';
import 'package:task_todo/App/Helper/global_helper.dart';
import 'package:task_todo/App/Utils/app_colors.dart';
import 'package:task_todo/App/Utils/app_localization.dart';
import 'package:task_todo/App/Utils/app_strings.dart';
import 'package:task_todo/App/Utils/app_themes.dart';
import 'package:task_todo/App/Utils/global_var.dart';
import 'package:task_todo/App/Utils/navigator.dart';
import 'package:task_todo/App/Utils/regular_expressions.dart';
import 'package:task_todo/App/Widgets/alerts_widgets.dart';
import 'package:task_todo/App/Widgets/buttons_widgets.dart';
import 'package:task_todo/App/Widgets/global_widgets.dart';
import 'package:task_todo/App/Widgets/packages_widgets.dart';
import 'package:task_todo/App/Widgets/text_widgets.dart';
import 'package:task_todo/App/databases/api/end_points.dart';


class App {
  //static final GoogleMapService map = GoogleMapService();
  //static final SaveProfile profile = SaveProfile();
  static final AppStrings strings = AppStrings(); // AppStrings
  static final AppColor color = AppColor(); // Colors
  static final RegularExpression regExp = RegularExpression(); // RegularExpression
  static final BaseAppNavigator navigator = AppNavigator(); // Navigator.
  static final BaseAppValidator validator = AppValidator(); // Validator.
  static final BaseAppThemes theme = AppThemes(); // Themes
  static final BaseAlertWidgets alertWidgets = AlertWidgets(); // AlertWidgets
  static final BasePackagesWidgets packageWidgets = PackagesWidgets(); // Packages Widgets
  static final BaseGlobalWidgets globalWidgets = GlobalWidgets(); // GlobalWidgets
  static final BaseButtonsWidgets buttons = ButtonsWidgets(); // Every Buttons
  static final BaseTextWidgets text = TextWidget(); // Every Text Widgets
  //static final BaseLocalizationHelper localization = LocalizationHelper(); // Localization
  static final BaseGlobalHelper global = GlobalHelper();
  //static final DioHelper dio = DioHelper();
  //static final BaseFirebaseFCM fcm = FirebaseFCM();
  //static final BaseGeoLocatorHelper location = GeoLocatorHelper();
  static final GlobalContext contextApp = GlobalContext();
  static final EndPoints endPoints = EndPoints();
  static final ApiKey apikey = ApiKey();
  //static final BaseFireBase firebase = FireBase();
}


/// Extension For BuildContext
extension MainContext on BuildContext {
  AppLocalization? get lang => AppLocalization.of(this);
  ThemeData get theme => Theme.of(this);
  bool get isDark => (theme.brightness == Brightness.dark); /// To Check Theme is Dark or Light
  ModalRoute<Object?>? get modal => ModalRoute.of(this);
  bool get keyBoard => MediaQuery.of(this).viewInsets.bottom == 0; /// To Check KeyBoard Hide or No
  Size get mediaQ => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get heightAppBar => MediaQuery.of(this).size.height - AppBar().preferredSize.height;
  double get width => MediaQuery.of(this).size.width;
  NavigatorState get navigator => Navigator.of(this);
  ScaffoldMessengerState get scaffoldState => ScaffoldMessenger.of(this);
}