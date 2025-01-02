import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Introduction/Widget/init_intro.dart';


class MobileIntroPage extends StatelessWidget {
  final InitIntro init;
  final FlutterSecureStorage secureStorage;

  const MobileIntroPage({super.key, required this.init, required this.secureStorage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          const Expanded(
              flex: 4,
              child: Image(
                  image: AssetImage('assets/images/intro.png') ,
                  fit: BoxFit.cover,
                  width: double.infinity,
              )
          ) ,

          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [

                const Column(
                  children: [
                     Text("Task Management &", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),) ,
                     Text("To-Do List ", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),) ,
                  ],
                ) ,

                const Column(
                  children: [
                    Text("This productive tool is designed to help  ",
                        style: TextStyle(
                            fontSize: 17.0 ,
                            fontWeight: FontWeight.normal
                        )) ,
                    Text("you better manage your task", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),) ,
                    Text("project-wise conveniently!", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),) ,

                  ],
                ) ,

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0)),
                        backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF5F33E1)),
                        foregroundColor: WidgetStateProperty.all<Color>(App.color.helperWhite),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 30.0)) ,
                      ),
                      onPressed: () async {
                        await init.main.navigateToLogin(context: context, secureStorage: secureStorage);
                      } ,
                      label: const Text("Let’s Start",style: TextStyle(fontSize: 18.0),) ,
                      icon: const Icon(Icons.navigate_next),
                      iconAlignment: IconAlignment.end
                  ),
                )


              ],
            ),
          )

        ],
      ),
    );
  }
}
