import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class BottomBarProvider extends ChangeNotifier {

  // /// List for Bottom Navigation Bar
  // final List<Widget> pages = const [
  //    MainProductsScreen() ,
  //    MainCartScreen() ,
  // ];


  // List<Widget> pages({required UserEntities user, required FlutterSecureStorage prefSecureStorage}) {
  //   final List<Widget> pages = [
  //       MainHomeScreen(userModel: user, prefSecureStorage: prefSecureStorage) ,
  //       //MainFavoriteScreen(userModel: userModel) ,
  //       MainCartsScreen(user: user, prefSecureStorage: prefSecureStorage) ,
  //       MainOrdersScreen(user: user, prefSecureStorage: prefSecureStorage) ,
  //   ];
  //
  //   return pages;
  // }


  /// Integer
  int integer = 0;

  int equalValueInteger(int v) {
    notifyListeners();
    return integer = v;
  }
}

class BooleanProvider extends ChangeNotifier {
  bool boolean = true;

  bool equalValueBoolean(bool v){
    notifyListeners();
    return boolean = v;
  }

  bool switchBoolean(){
    notifyListeners();
    return boolean = !boolean;
  }

  bool trueBoolean(){
    notifyListeners();
    return boolean = true;
  }

  bool falseBoolean(){
    notifyListeners();
    return boolean = false;
  }
}

class IntegerProvider extends ChangeNotifier {
  /// Integer
  int integer = 0;

  int equalValueInteger(int v) {
    notifyListeners();
    return integer = v;
  }
}

class StringProvider extends ChangeNotifier {
  /// Strings
  String strings = '';

  String equalValueString(String v){
    notifyListeners() ;
    return strings = v;
  }

  void equalStringNull(){
    strings = '';
    notifyListeners();
  }
}

class ListProvider extends ChangeNotifier {

  final List data = [];

  void add({required Object value}) {
    data.add(value);
    notifyListeners();
  }

  void addAll({required List value}) {
    data.addAll(value);
    notifyListeners();
  }

  void insert({required int index, required Object value}) {
    data.insert(index, value);
    notifyListeners();
  }

  void insertAll({required int index, required List value}) {
    data.insertAll(index, value);
    notifyListeners();
  }

  void update({required int index, required dynamic value}) {
    data[index] = value;
    notifyListeners();
  }

  void updateAt({required int index, required String key, required dynamic value}) {
    data.elementAt(index)[key] = value;
    notifyListeners();
  }

  void remove({required Object value}) {
    data.remove(value);
    notifyListeners();
  }

  void removeAt({required int index}) {
    data.removeAt(index);
    notifyListeners();
  }

  void removeLast() {
    data.removeLast();
    notifyListeners();
  }

  void removeAll() {
    data.clear();
    notifyListeners();
  }

  void removeRange({required int start, required int end}) {
    data.removeRange(start, end);
    notifyListeners();
  }

}


class HiveProvider extends ChangeNotifier {
  List dataHive = [];


  // void fetchDataHive({required Box boxName}) {
  //   dataHive = boxName.values.toList();
  //   notifyListeners();
  // }

  void addHive({required dynamic model}) {
    dataHive.add(model);
    notifyListeners();
  }

  void deleteHive({required int index}) {
    dataHive.removeAt(index);
    notifyListeners();
  }

  void updateHive({required int index , required dynamic model}) {
    dataHive[index] = model;
    notifyListeners();
  }

}

class ImagePickerProvider extends ChangeNotifier {
  /// To Get Images from Gallery or Camera
  /// Single Image
  File? fileImage;
  Future<void> getImagePicker({required BuildContext context,required ImageSource imageSource}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: imageSource);

      if (image != null) {
        fileImage = File(image.path);
      } else {
        //customSnackBar(text: 'your arn\'t selected Image', context: context);
      }

      notifyListeners();
    }on PlatformException catch(_) {
      //customSnackBar(text: 'your arn\'t selected Image', context: context);
    }
  }

  void deleteImagePicker() {
    fileImage = null;
    notifyListeners();
  }

  /// Multi Image
  final List<dynamic> images = [];
  Future<void> getMultiImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();

    if (selectedImages.isNotEmpty) {
      images.addAll(selectedImages);
    }
    notifyListeners();
  }

  void clearMultiImages() {
    images.clear();
    notifyListeners();
  }

  void deleteMultiImages({required int index}) {
    images.removeAt(index);
    notifyListeners();
  }

}

class STTProvider extends ChangeNotifier {
  // final SpeechToText speechToText = SpeechToText();
  // bool speechEnable = false;
  // bool isListening = false;
  // //late bool isAvailable;
  // String wordSpeak = "";
  // final TextEditingController wordSpeakController = TextEditingController();
  // double confidenceLevel = 0;
  //
  // initSpeech() async {
  //   try{
  //   speechEnable = await speechToText.initialize();
  //   }on PlatformException catch(e) {
  //     log(e.code);
  // // App.alertWidgets.snackBar(text: "Check your Permission", context: context);
  //
  // }
  //
  //   notifyListeners();
  // }
  //
  // Future<void> startListening() async {
  //   await speechToText.listen(
  //       onResult: (SpeechRecognitionResult result) {
  //         wordSpeak = result.recognizedWords;
  //         wordSpeakController.text = result.recognizedWords;
  //         confidenceLevel = result.confidence;
  //         notifyListeners();
  //       }).then((value) {
  //         isListening = true;
  //       });
  //
  //   confidenceLevel = 0;
  //   notifyListeners();
  // }
  //
  // Future<void> stopListening() async {
  //   await speechToText.stop();
  //   isListening = false;
  //   notifyListeners();
  // }
  //
  // void clearController() {
  //   wordSpeakController.clear();
  //   notifyListeners();
  // }
  //
  // void equalController(String value) {
  //   wordSpeakController.text = value;
  //   notifyListeners();
  // }

}

