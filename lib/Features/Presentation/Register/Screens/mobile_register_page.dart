import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/enums.dart';
import 'package:task_todo/App/WidgetsHelper/Global/auth_text_feild.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Controller/Auth/auth_provider.dart';
import 'package:task_todo/Features/Presentation/Register/Widget/init_register.dart';


class MobileRegisterPage extends StatefulWidget {
  final InitRegister init;
  final FlutterSecureStorage secureStorage;
  const MobileRegisterPage({super.key, required this.init, required this.secureStorage});

  @override
  State<MobileRegisterPage> createState() => _MobileRegisterPageState();
}

class _MobileRegisterPageState extends State<MobileRegisterPage> {
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
                  height: keyBoard ? constraints.maxHeight * 0.3 : context.mediaQ.height * 0.3,
                  child: const Image(
                      image: AssetImage('assets/images/intro_register.png') ,
                      fit: BoxFit.cover,
                      width: double.infinity,
                  )
              ) ,

              SizedBox(
                height: keyBoard ? constraints.maxHeight * 0.7 : context.mediaQ.height * 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    children:  [

                      const Align(
                          alignment: Alignment.centerLeft ,
                          child: Text("Register", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))) ,


                      AuthTextField(
                        maxLines: 1 ,
                        controller: widget.init.main.controller.name,
                        inputAction: TextInputAction.next ,
                        inputType: TextInputType.text ,
                        hint: "Name",
                      ) ,


                      AuthTextField(
                        phone: false ,
                        password: true ,
                        maxLines: 1 ,
                        controller: widget.init.main.controller.phone,
                        inputAction: TextInputAction.next ,
                        inputType: TextInputType.phone ,
                        hint: "Phone",
                      ),


                      AuthTextField(
                        //maxLines: 1 ,
                        controller: widget.init.main.controller.years,
                        inputAction: TextInputAction.next ,
                        inputType: TextInputType.number ,
                        hint: "Years of Experience",
                      ) ,


                      DropdownMenu(
                          label: const Text("Choose Experience Level") ,
                          width: double.infinity ,
                          controller: widget.init.main.controller.levels,
                          onSelected: (v) {

                          },
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true ,
                            //fillColor: App.color.helperWhite ,
                            //fillColor: Colors.red ,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0) ,
                              borderSide: BorderSide(color: App.color.helperGrey200,width: 2.0),
                            ) ,
                          ),

                          dropdownMenuEntries: List.generate(widget.init.main.level.length, (i){
                            final String index = widget.init.main.level.elementAt(i);
                            return DropdownMenuEntry(value: index, label: index );
                          })
                      ) ,

                      AuthTextField(
                        controller: widget.init.main.controller.address ,
                        inputAction: TextInputAction.next ,
                        inputType: TextInputType.streetAddress ,
                        hint: "Address",
                      ) ,

                      Consumer(
                        builder: (context,prov,_) {
                          final provider = prov.watch(widget.init.main.registerPwProv);
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
                                  },
                                  icon: !provider.boolean ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
                              ),
                          );
                        }
                      ) ,

                      Flexible(
                        child: Padding(

                          padding: const EdgeInsets.all(10.0),
                          child: Consumer(
                              builder: (context, prov, _) {
                                final ProvidersState state = prov.watch(registerNotifier(widget.secureStorage));

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
                                        return await widget.init.register.register(
                                            ref: prov,
                                            context: context,
                                            init: widget.init,
                                            secureStorage: widget.secureStorage
                                        );
                                      } ,
                                      label: const Text("Sign up",style: TextStyle(fontSize: 18.0),) ,
                                    );
                                }}
                          ),
                        ),
                      ) ,
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
