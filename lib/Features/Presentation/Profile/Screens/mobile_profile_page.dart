import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';
import 'package:task_todo/Features/Presentation/Profile/Widget/init_profile.dart';


class MobileProfilePage extends StatefulWidget {
  final InitProfile init;
  final FlutterSecureStorage secureStorage;
  final UserEntities model;
  const MobileProfilePage({super.key, required this.init, required this.secureStorage, required this.model});

  @override
  State<MobileProfilePage> createState() => _MobileProfilePageState();
}

class _MobileProfilePageState extends State<MobileProfilePage> {
  @override
  Widget build(BuildContext context) {
    //final bool keyBoard = MediaQuery.of(context).viewInsets.bottom == 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w500)),
        leading: const BackButton(),
        leadingWidth: 20.0,
      ),


        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                alignment: Alignment.centerLeft ,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    const Flexible(child: Text("name")) ,
                    Flexible(child: Text(widget.model.name,style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                  ],
                ),
              ),
            ) ,
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                alignment: Alignment.centerLeft ,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    const Flexible(child: Text("Phone")) ,
                    Flexible(child: Text(widget.model.phone,style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                  ],
                ),
              ),
            ) ,
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                alignment: Alignment.centerLeft ,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    const Flexible(child: Text("Level")) ,
                    Flexible(child: Text(widget.model.level,style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                  ],
                ),
              ),
            ) ,
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                alignment: Alignment.centerLeft ,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    const Flexible(child: Text("Years of experience")) ,
                    Flexible(child: Text(widget.model.years.toString(),style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                  ],
                ),
              ),
            ) ,
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                alignment: Alignment.centerLeft ,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    const Flexible(child: Text("Location")) ,
                    Flexible(child: Text(widget.model.address,style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),)),
                  ],
                ),
              ),
            ) ,
            const Spacer(flex: 2)
          ],
        )
    );
  }
}
