// import 'package:e_commerce_system/Admin/Presentation/Dashboard/Screens/main_dashboard_screen.dart';
// import 'package:e_commerce_system/App/Utils/enums.dart';
// import 'package:e_commerce_system/Features/Carts/Presentation/Carts/Controller/cart_providers.dart';
// import 'package:e_commerce_system/Features/Categories/Presentation/Controller/category_provider.dart';
// import 'package:e_commerce_system/Features/Home/Presentation/Home/Controller/home_provider.dart';
// import 'package:e_commerce_system/Features/Orders/Presentation/Controller/orders_provider.dart';
// import 'package:e_commerce_system/Features/Orders/Presentation/OrdersDrivers/Screens/main_drivers_orders_screen.dart';
// import 'package:e_commerce_system/Features/Orders/Presentation/ProcessDrivers/Screens/main_process_orders_screen.dart';
// import 'package:e_commerce_system/Features/Public/Presentation/BottomBar/Screens/main_bottom_bar_screen.dart';
// import 'package:e_commerce_system/Features/Search/Presentation/Controller/search_provider.dart';
// import 'package:e_commerce_system/Models/Entities/user_entities.dart';
// import 'package:e_commerce_system/Models/Models/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:dio/dio.dart';
//
// class SaveProfile {
//
//   Future<void> setSecureUserModel({required FlutterSecureStorage secure, required Response response}) async {
//     final Map<String,dynamic> data = await response.data['data'];
//     await secure.write(key: SecureStorageEnum.setIsAdmin.name, value: data['isAdmin'].toString());
//     await secure.write(key: SecureStorageEnum.setUserId.name, value: data['_id'].toString());
//     await secure.write(key: SecureStorageEnum.setToken.name,value: await response.data['token']);
//     await secure.write(key: SecureStorageEnum.setUserEmail.name, value: data['email']);
//     await secure.write(key: SecureStorageEnum.setUserName.name, value: data['name']);
//     await secure.write(key: SecureStorageEnum.setIsActive.name, value: data['isActive'].toString());
//     await secure.write(key: SecureStorageEnum.createdAt.name, value: data['createdAt']);
//     await secure.write(key: SecureStorageEnum.updatedAt.name, value: data['updatedAt']);
//   }
//
//
//   Future<UserEntities> getSecureUserModel({required FlutterSecureStorage secure}) async {
//     final Map<String,dynamic> data = <String,dynamic>{
//       SecureStorageEnum.createdAt.name: await secure.read(key: SecureStorageEnum.createdAt.name) ,
//       SecureStorageEnum.updatedAt.name: await secure.read(key: SecureStorageEnum.updatedAt.name) ,
//       SecureStorageEnum.setToken.name: await secure.read(key: SecureStorageEnum.setToken.name) ,
//       SecureStorageEnum.setUserId.name: await secure.read(key: SecureStorageEnum.setUserId.name) ,
//       SecureStorageEnum.setIsAdmin.name: await secure.read(key: SecureStorageEnum.setIsAdmin.name) ,
//       SecureStorageEnum.setIsActive.name: await secure.read(key: SecureStorageEnum.setIsActive.name) ,
//       SecureStorageEnum.setUserName.name: await secure.read(key: SecureStorageEnum.setUserName.name) ,
//       SecureStorageEnum.setUserEmail.name: await secure.read(key: SecureStorageEnum.setUserEmail.name) ,
//     };
//     final UserEntities userModel = UserModel.fromJson(data);
//     return userModel;
//   }
//
//
//   Widget navigateToScreens({
//     required FlutterSecureStorage prefSecureStorage ,
//     required UserEntities user ,
//     required Response response ,
//     required WidgetRef ref ,
//   }) {
//
//     if(response.data['data']['isAdmin'] == UserEnum.user.index + 1) {
//
//       return MainBottomBarScreen(userModel: user, prefSecureStorage: prefSecureStorage);
//
//     } else if(response.data['data']['isAdmin'] == UserEnum.admin.index + 1 ) {
//
//       return MainDashboardScreen(user: user, prefSecureStorage: prefSecureStorage);
//
//     } else if(response.data['data']['isAdmin'] == UserEnum.driver.index + 1) {
//
//       if(response.data['data']['isActive'] == true) {
//
//       return MainDriversProcessScreen(user: user, prefSecureStorage: prefSecureStorage);
//
//       } else {
//
//         return MainDriversOrdersScreen(user: user, prefSecureStorage: prefSecureStorage, driverId: user.id.toString());
//
//       }
//     } else {
//
//       return MainBottomBarScreen(userModel: user, prefSecureStorage: prefSecureStorage);
//
//     }
//   }
//
//
//   Future<void> logoutSecureUserModel() async {
//     const FlutterSecureStorage secureStorage = FlutterSecureStorage();
//     return await secureStorage.deleteAll();
//   }
//
// }