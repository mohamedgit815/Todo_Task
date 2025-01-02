import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/enums.dart';
import 'package:task_todo/App/WidgetsHelper/Global/auth_text_feild.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Controller/Auth/auth_provider.dart';
import 'package:task_todo/Features/Presentation/Login/Widget/init_login.dart';


class MobileLoginPage extends StatefulWidget {
  final InitLogin init;
  final FlutterSecureStorage secureStorage;
  const MobileLoginPage({super.key, required this.init, required this.secureStorage});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    final bool keyBoard = MediaQuery.of(context).viewInsets.bottom == 0;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) => ListView(
            children: [

              SizedBox(
                  height: keyBoard ? constraints.maxHeight * 0.6 : context.mediaQ.height * 0.4,
                  child: const Image(
                      image: AssetImage('assets/images/intro.png') ,
                      fit: BoxFit.cover,
                      width: double.infinity,
                  )
              ) ,

              SizedBox(
                height: keyBoard ? constraints.maxHeight * 0.4 : context.mediaQ.height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    children:  [

                      const Align(
                          alignment: Alignment.centerLeft ,
                          child: Text("Login", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))) ,

                      AuthTextField(
                        phone: false ,
                        password: true ,
                        maxLines: 1 ,
                        controller: widget.init.main.controller.phone,
                        inputAction: TextInputAction.next ,
                        inputType: TextInputType.phone ,
                        hint: "Phone",
                      ),

                      Consumer(
                        builder: (context, prov, _) {
                          final provider = prov.watch(widget.init.main.loginPwProv);
                          return AuthTextField(
                              phone: true ,
                              password: provider.boolean ,
                              maxLines: 1 ,
                              controller: widget.init.main.controller.password ,
                              inputAction: TextInputAction.done ,
                              inputType: TextInputType.visiblePassword ,
                              hint: "Password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.switchBoolean();
                                  } ,
                                  icon: provider.boolean ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                          );
                        }
                      ) ,

                      Expanded(
                        child: Padding(
                          
                          padding: const EdgeInsets.all(10.0),
                          child: Consumer(
                            builder: (context, prov, _) {
                              final ProvidersState state = prov.watch(loginNotifier(widget.secureStorage));
                        
                              switch(state.buttonState) {
                        
                                case RequestsState.loading :
                                  return const Center(
                                      child: CircularProgressIndicator.adaptive());
                        
                        
                                default :
                        
                                  return ElevatedButton.icon(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0)),
                                    backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF5F33E1)),
                                    foregroundColor: WidgetStateProperty.all<Color>(App.color.helperWhite),
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                                    minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 30.0)) ,
                                  ),
                                  onPressed: () async {
                                    return await widget.init.loginScreen.login(
                                        ref: prov,
                                        context: context,
                                        secureStorage: widget.secureStorage,
                                        init: widget.init
                                    );
                                  } ,
                                  label: const Text("Sign in",style: TextStyle(fontSize: 18.0),) ,
                              );
                            }}
                          ),
                        ),
                      ) ,

                      Flexible(
                          child: InkWell(
                            onTap: () async {
                              widget.init.loginScreen.navigateToRegister(context:context, secureStorage: widget.secureStorage);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Did’t have any account? "),
                                Text("Sign Up here",style: TextStyle(fontSize: 15.0,color: App.color.lightMain),),
                              ],
                            ),
                          ))

                    ],
                  ),
                ),
              )

            ]),
          ),
      ),
    );
  }
}
