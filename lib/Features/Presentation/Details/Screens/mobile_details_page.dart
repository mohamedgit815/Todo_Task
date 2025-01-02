import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Presentation/Details/Widget/init_details.dart';
import 'package:task_todo/Features/Presentation/Home/Widget/init_home.dart';


class MobileDetailsPage extends ConsumerStatefulWidget {
  final InitDetails init;
  final InitHome initHome;
  final FlutterSecureStorage secureStorage;
  final HomeEntities model;
  final int index;
  const MobileDetailsPage({super.key,
    required this.init,
    required this.index,
    required this.initHome,
    required this.model ,
    required this.secureStorage
  });

  @override
  ConsumerState<MobileDetailsPage> createState() => _MobileDetailsPageState();
}

class _MobileDetailsPageState extends ConsumerState<MobileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    //final bool keyBoard = MediaQuery.of(context).viewInsets.bottom == 0;
    final Size mediaQ = MediaQuery.of(context).size;

    return Scaffold(
        body: CustomScrollView(
          slivers: [

             SliverAppBar(
              title: const Text("Task Details",style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold) ,),
              floating: true ,
              snap: true ,
              leading: const BackButton(),
              leadingWidth: 20.0,

              actions: [
                DropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 1 ,
                        onTap: () async {
                          return await widget.initHome.homeScreen.deleteItem(
                              ref: ref ,
                              model: widget.model ,
                              context: context,
                              secureStorage: widget.secureStorage,
                              index: widget.index
                          );
                        },
                        child: const Text('Delete',style: TextStyle(fontSize: 17.0,color: Colors.white),),
                      ),

                       const DropdownMenuItem(
                        value: 1 ,
                        child: Text('Edit',style: TextStyle(fontSize: 17.0,color: Colors.white),),
                      ),


                    ], onChanged: (v){} ,
                    icon: const Icon(Icons.more_vert,color: Colors.black,)
                )

              ],
            ) ,

            SliverToBoxAdapter(
              child: SizedBox(
                  height: mediaQ.height * 0.3,
                  child: Image.asset('assets/images/details.png',fit: BoxFit.cover,)) ,
            ) ,

             SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.model.title,
                style: const TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),
                ),
              ),
            ) ,
             SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.model.desc,
                  //"sfjkdljsdhfjkhsdajkfhasdjkfhgggggggashfffffffffffffffffffffffffffffffffffffffffffffhjghjgfffffffffffffffffffffffffffffsdfhjgbvhjasdvghjgffffffffffffffffffffffshjgfsgsdhjsgfhgashjggfshj",
                style: const TextStyle(fontSize: 17.0),
                ),
              ),
            ) ,


            SliverToBoxAdapter(
              child: Container(
                height: mediaQ.height * 0.08,
                margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                decoration: const BoxDecoration(
                  color: Color(0xffF0ECFF) ,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('date',
                                style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color: Colors.grey),
                              ),
                              Text(widget.model.createdAt,
                                style: const TextStyle(fontSize: 17.0,
                                    fontWeight: FontWeight.w600,color: Colors.black54),
                              ),
                            ],
                          )),

                      const Flexible(child: Icon(Icons.date_range,size: 30.0,color: Color(0xff5F33E1)))
                    ],
                  ),
                ),
              ),
            ) ,
            SliverToBoxAdapter(
              child: Container(
                height: mediaQ.height * 0.08,
                margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                decoration: const BoxDecoration(
                  color: Color(0xffF0ECFF) ,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(widget.model.status,
                        style: const TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,color: Color(0xff5F33E1)),
                      )),

                      const Flexible(child: Icon(Icons.arrow_drop_down_sharp,size: 50.0,color: Color(0xff5F33E1)))
                    ],
                  ),
                ),
              ),
            ) ,
            SliverToBoxAdapter(
              child: Container(
                height: mediaQ.height * 0.08,
                margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                decoration: const BoxDecoration(
                  color: Color(0xffF0ECFF) ,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)) ,
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Row(
                            children: [
                              const Flexible(child: Icon(Icons.outlined_flag,size: 30.0,color: Color(0xff5F33E1))) ,

                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(widget.model.priority,
                                    style: const TextStyle(fontSize: 19.0,fontWeight: FontWeight.w600,color: Color(0xff5F33E1)),),
                                ),
                              )
                            ],
                          )
                      ),

                      const Flexible(child: Icon(Icons.arrow_drop_down_sharp,size: 50.0,color: Color(0xff5F33E1)))
                    ],
                  ),
                ),
              ),
            ) ,


            SliverToBoxAdapter(
              child: SizedBox(
                  height: mediaQ.height * 0.4,
                  child: Image.asset('assets/images/scanner.png',fit: BoxFit.contain,)) ,
            ) ,

            const SliverToBoxAdapter(child:    SubmenuButton(menuChildren: [],
                child: Icon(Icons.more_vert)
            ),)


          ],
        )
    );
  }
}
