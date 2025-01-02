import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/enums.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Data/Models/home_model.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Presentation/Controller/Home/home_provider.dart';
import 'package:task_todo/Features/Presentation/Home/Widget/init_home.dart';


class MobileHomePage extends ConsumerStatefulWidget {
  final InitHome init;
  final FlutterSecureStorage secureStorage;
  const MobileHomePage({super.key, required this.init, required this.secureStorage});

  @override
  ConsumerState<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends ConsumerState<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    //final bool keyBoard = MediaQuery.of(context).viewInsets.bottom == 0;
    final Size mediaQ = MediaQuery.of(context).size;

    return Scaffold(

        floatingActionButton: Consumer(
          builder: (context, prov, _) {
            return Visibility(
              visible: prov.watch(widget.init.main.scrollProv).boolean ,
              child: FloatingActionButton(
                  onPressed: () async {
                    await widget.init.homeScreen.navigateToUpload(
                        context: context,
                        secureStorage: widget.secureStorage);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                  child: const Icon(Icons.add)
              ),
            );
          }
        ),
      
      
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if(notification.direction == ScrollDirection.forward) {
              return ref.read(widget.init.main.scrollProv).trueBoolean();
            } else if(notification.direction == ScrollDirection.reverse) {
              return ref.read(widget.init.main.scrollProv).falseBoolean();
            }
            return true;
          },
          child: RefreshIndicator(
            color: Colors.white,
            onRefresh: () async {
               await ref.read(
                  homeNotifier(widget.secureStorage).notifier).fetchHome(
                  status: null
              );
            },
            child: CustomScrollView(
              controller: widget.init.main.scrollController,
              //crossAxisAlignment: CrossAxisAlignment.start ,
              slivers: [

                SliverAppBar(
                  title: const Text("Logo",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold) ,),
                  floating: true ,
                  snap: true ,
                  actions: [
                    IconButton(onPressed: () async {

                      await widget.init.homeScreen.navigateToProfile(
                          context: context,
                          secureStorage: widget.secureStorage
                      );

                    }, icon: const Icon(Icons.person_pin, color: Colors.black)),
                    IconButton(onPressed: () async {
                      return await App.alertWidgets.globalAlertDialog(
                          onPressed: () async {
                            return await widget.init.homeScreen.logOut(
                                ref: ref,
                                context: context,
                                secureStorage: widget.secureStorage
                            );
                          },
                          context: context
                      );
                    }, icon: Icon(Icons.logout,color: App.color.lightMain)),
                  ],
                ) ,

                const SliverToBoxAdapter(
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("MY Tasks")),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: mediaQ.height * 0.1,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.init.main.chooseData.length ,
                        itemBuilder: (context,i) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ChoiceChip(
                                label: Text(widget.init.main.chooseData[i]) ,
                                labelStyle: TextStyle(color: i == 0 ? Colors.white : Colors.grey) ,


                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                                ),

                                selected: i == 0 ? true : false ,
                                showCheckmark: false ,
                                backgroundColor: const Color(0xffF0ECFF) ,
                                selectedColor: App.color.lightMain ,
                                side: BorderSide(color: App.color.helperTransparent) ,
                                onSelected: (value) {}
                            ),
                          );
                        }
                    ),
                  ),
                ) ,

                Consumer(
                    builder: (context,prov, _) {
                  final ProvidersState state = prov.watch(homeNotifier(widget.secureStorage));
                  //final OrdersProvNotifier provider = prov.read(fetchDriversProv.notifier);

                  switch(state.state) {

                    case RequestsState.failure :
                      return SliverToBoxAdapter(child: Center(child: Text(state.errorMsg)));


                    case RequestsState.local :
                      return SliverToBoxAdapter(child: Center(child: Text(state.errorMsg)));

                    case RequestsState.loading :
                      return const SliverToBoxAdapter(child:  Center(child: CircularProgressIndicator.adaptive()));

                      default :
                        return SliverList.builder(
                            itemCount: state.data.length + (state.hasMore ? 1 : 0),
                            itemBuilder: (context,i) {


                              if(i < state.data.length) {
                                final HomeEntities model = HomeModel.fromJson(state.data.elementAt(i));


                                return GestureDetector(
                                  onTap: () {
                                    widget.init.homeScreen.navigateToDetails(
                                        context: context,
                                        secureStorage: widget.secureStorage,
                                        id: model.id,
                                        initHome: widget.init,
                                        index: i
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
                                    alignment: Alignment.centerLeft ,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    child: Row(

                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset('assets/images/home.png',fit: BoxFit.cover,)
                                        ) ,

                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                               Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                                children: [

                                                  Flexible(
                                                    flex: 3,
                                                    child: Text(model.title ,
                                                      maxLines: 1 ,
                                                      overflow: TextOverflow.ellipsis ,
                                                      style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),


                                                  Flexible(
                                                      flex: 2,
                                                      child: Card(
                                                        color:  widget.init.homeScreen.subStatus(model),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Text(model.status,
                                                            style: TextStyle(color:  widget.init.homeScreen.status(model)
                                                            ),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                  ) ,



                                                ],
                                              ) ,

                                              Text(model.desc ,
                                                //"sdjklgadghjkdhsjkfhsjkfhsjkagfgfgfgfgfgfgfgfgfgfgfgfdasdasd",
                                                maxLines: 1 ,
                                                overflow: TextOverflow.ellipsis,
                                              ),


                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                children: [
                                                  Flexible(
                                                    child: TextButton.icon(
                                                        onPressed: null,
                                                        style: TextButton.styleFrom(
                                                          foregroundColor: Colors.red
                                                        ),
                                                        label: Text(model.priority, style: TextStyle(color:widget.init.homeScreen.priority(model))) ,
                                                        icon: Icon(Icons.flag,color: widget.init.homeScreen.priority(model))
                                                    ),
                                                  ) ,
                                                  Flexible(child: Text(model.createdAt.substring(0,10))) ,
                                                ],
                                              ) ,
                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Visibility(
                                    visible: !state.hasMore ? false : true ,
                                    child: const Center(child: CircularProgressIndicator.adaptive()));
                              }


                            }
                        );
                  }

                }
                )

              ],
            ),
          ),
        )
    );
  }
}
