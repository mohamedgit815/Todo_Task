import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/enums.dart';
import 'package:task_todo/App/WidgetsHelper/Global/animated_conditional_builder.dart';
import 'package:task_todo/App/WidgetsHelper/Global/auth_text_feild.dart';
import 'package:task_todo/App/app.dart';
import 'package:task_todo/Features/Presentation/Controller/Home/home_provider.dart';
import 'package:task_todo/Features/Presentation/Upload/Widget/init_upload.dart';


class MobileUploadPage extends StatefulWidget {
  final InitUpload init;
  final FlutterSecureStorage secureStorage;
  const MobileUploadPage({super.key, required this.init, required this.secureStorage});

  @override
  State<MobileUploadPage> createState() => _MobileUploadPageState();
}

class _MobileUploadPageState extends State<MobileUploadPage> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQ = MediaQuery.of(context).size;
   return Scaffold(

     appBar: AppBar(
       title: const Text('Add new Task',style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.w600)),
       leading: const BackButton(),
       leadingWidth: 20.0,
     ),


     body: GestureDetector(
       onTap: () {
         FocusScope.of(context).unfocus();
       },
       child: ListView(
         children: [

           Consumer(
             builder: (context, prov, _) {
               final provider = prov.watch(widget.init.main.imageProv);

               return AnimatedConditionalBuilder(
                   condition: provider.fileImage != null,

                   builder: (_) {
                     return Container(
                       width: double.infinity ,
                       height: mediaQ.height * 0.2,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                             image: FileImage(provider.fileImage!) ,
                              fit: BoxFit.contain
                         )
                       ),
                       alignment: Alignment.topRight,
                       child: IconButton.filled(onPressed: () {
                         provider.deleteImagePicker();
                       }, icon: const Icon(Icons.close)),
                     );
                   },
                   fallback: (_) {
                     return Container(
                       width: double.infinity ,
                       height: mediaQ.height * 0.07,
                       margin: const EdgeInsets.all(10.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0) ,
                         border: Border(
                           top: BorderSide(color: App.color.lightMain) ,
                           left: BorderSide(color: App.color.lightMain) ,
                           right: BorderSide(color: App.color.lightMain) ,
                           bottom: BorderSide(color: App.color.lightMain) ,
                         ),
                         // color: Colors.red,
                       ),

                       child: InkWell(
                         onTap: () {
                           App.alertWidgets.showAlertDialog(
                               context: context,
                               builder: (_){
                                 return SimpleDialog(
                                   children: [
                                     TextButton(onPressed: () async {
                                       await provider.getImagePicker(
                                           context: context,
                                           imageSource: ImageSource.camera
                                       ).then((_) {
                                         if(context.mounted) {
                                           Navigator.of(context).maybePop();
                                         }
                                       });
                                     }, child: const Text("Camera")),
                                     TextButton(onPressed: () {
                                       provider.getImagePicker(
                                           context: context,
                                           imageSource: ImageSource.gallery
                                       ).then((_) {
                                         if(context.mounted) {
                                           Navigator.of(context).maybePop();
                                         }
                                       });
                                     }, child: const Text("Gallery")),
                                   ],
                                 );
                               });



                         },
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Icon(Icons.image,color: App.color.lightMain,size: 25.0,),
                             ) ,
                             Text('Add Image',style: TextStyle(color: App.color.lightMain,fontSize: 18.0),)
                           ],
                         ),
                       ),
                     );
                   }
               );
             }
           ) ,

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Text("Task Title",style: TextStyle(color: App.color.helperBlack,fontSize: 16.0),),
                 ) ,
                 AuthTextField(
                   controller: widget.init.main.controller.title ,
                   inputAction: TextInputAction.next ,
                   inputType: TextInputType.text ,
                   hint: "Enter title here...",
                   maxLines: 1,
                 ),
               ],
             ),
           ) ,

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Text("Task Description",style: TextStyle(color: App.color.helperBlack,fontSize: 16.0),),
                 ) ,
                 AuthTextField(
                     controller: widget.init.main.controller.desc ,
                     inputAction: TextInputAction.next ,
                     inputType: TextInputType.text ,
                      hint: "Enter description here...",
                    maxLines: 7,
                 ),
               ],
             ),
           ) ,

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Text("Priority",style: TextStyle(color: App.color.helperBlack,fontSize: 15.0),),
                 ) ,

                 DropdownMenu(
                     label: TextButton.icon(onPressed: () {}, label: const Text("Medium Priority")) ,
                     width: double.infinity ,
                     controller: widget.init.main.controller.priority,
                     //controller: widget.init.main.controller.levels,
                     onSelected: (v) {

                     },
                     inputDecorationTheme: InputDecorationTheme(
                       filled: true ,
                       fillColor: const Color(0xffF0ECFF) ,
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0) ,
                         borderSide: BorderSide(color: App.color.helperGrey200,width: 2.0),
                       ) ,
                     ),

                     dropdownMenuEntries: List.generate(widget.init.main.priority.length, (i){
                       final String index = widget.init.main.priority.elementAt(i);
                       return DropdownMenuEntry(value: index, label: index );
                     }
                     )
                 ),
               ],
             ),
           ) ,

           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                 child: Text("Due date",style: TextStyle(color: App.color.helperBlack,fontSize: 15.0),),
               ) ,

               GestureDetector(
                 onTap: () async {

                   widget.init.main.dueDate = await showDatePicker(
                       context: context,
                       initialDate: DateTime.now(),
                       firstDate:  DateTime(2000) ,
                       lastDate: DateTime(2050)
                   );

                 },
                 child: Container(
                   width: double.infinity ,
                   height: mediaQ.height * 0.07,
                   margin: const EdgeInsets.all(10.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0) ,
                     border: Border(
                       top: BorderSide(color: App.color.helperBlack) ,
                       left: BorderSide(color: App.color.helperBlack) ,
                       right: BorderSide(color: App.color.helperBlack) ,
                       bottom: BorderSide(color: App.color.helperBlack) ,
                     ),
                     // color: Colors.red,
                   ),

                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('choose due date...',style: TextStyle(color: App.color.helperBlack,fontSize: 15.0),) ,

                         Icon(Icons.date_range,size: 25.0,color: App.color.lightMain,)
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ) ,

           Padding(

             padding: const EdgeInsets.all(10.0),
             child: Consumer(
                 builder: (context, prov, _) {
                   final ProvidersState state = prov.watch(uploadNotifier(widget.secureStorage));

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
                           return await widget.init.upload.uploadTasks(
                               context: context ,
                               ref: prov ,
                               init: widget.init,
                               prefSecureStorage: widget.secureStorage
                           );
                         } ,
                         label: const Text("Add Task",style: TextStyle(fontSize: 18.0),) ,
                       );
                   }}
             ),
           ) ,

         ],
       ),
     ),
   );
  }
}