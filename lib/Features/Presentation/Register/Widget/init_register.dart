
import 'package:task_todo/Features/Presentation/Register/Widget/main_register_state.dart';
import 'package:task_todo/Features/Presentation/Register/Widget/mobile_register_widgets.dart';


class InitRegister {
  final BaseRegisterState main = RegisterState();
  final BaseRegisterState register = RegisterState();

  final BaseMobileRegisterWidgets mobile = MobileRegisterWidgets();
}