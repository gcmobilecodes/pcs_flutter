import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pcs/view/auth/LoginScreen.dart';
import 'package:pcs/view/auth/SignupScreen.dart';
import 'package:pcs/view/home/ContactUsScreen.dart';
import 'package:pcs/view/home/EditProfileScreen.dart';
import 'package:pcs/view/home/HistoryScreen.dart';
import 'package:pcs/view/home/HomeScreen.dart';
import 'package:pcs/view/home/SettingScreen.dart';

void main() {
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

        home: const LoginScreen());
  }
}



