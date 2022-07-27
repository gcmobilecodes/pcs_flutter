import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pcs/service/api_service.dart';
import 'package:pcs/utils/SharedPref.dart';
import 'package:pcs/view/auth/LoginScreen.dart';
import 'package:pcs/view/auth/SignupScreen.dart';
import 'package:pcs/view/home/ContactUsScreen.dart';
import 'package:pcs/view/home/EditProfileScreen.dart';
import 'package:pcs/view/home/HistoryScreen.dart';
import 'package:pcs/view/home/HomeScreen.dart';
import 'package:pcs/view/home/SettingScreen.dart';
import 'package:pcs/view/home/TestingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Dio dio = new Dio();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().init();
  Get.put(APIService(dio));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        title: 'Splash Screen',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),


        debugShowCheckedModeBanner: false,
        home: SharedPref.getInstance()!.getAccessToken().isEmpty
            ? const LoginScreen()
            : HomeScreen());

     //   home: const SplashScreen());
  }




  }




