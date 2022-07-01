import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pcs/common_widget/button_widget.dart';
import 'package:pcs/common_widget/head_text_widget.dart';
import 'package:pcs/common_widget/text_widget.dart';
import 'package:pcs/common_widget/textfield_widget.dart';
import 'package:pcs/utils/asset_images.dart';
import 'package:pcs/utils/color_utils.dart';
import 'package:pcs/view/auth/LoginScreen.dart';

import '../home/HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _yournameController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void valfn() async {
    if (_formKey.currentState!.validate()) {
      Get.to(const HomeScreen());
    //   AppWidget.showDialogLoading();
    //   var params = {
    //     'unameORemail': _useridController.text,
    //     'pwd': _passwordController.text
    //   };
    //   Map map = await service.login(params);
    //   if (map['statusCode'] == 200) {
    //     AppWidget.hideDialog();
    //     SharedPref.getInstance()!.addStringToSF(AppKeys.loginId, map['data']['_id']);
    //     SharedPref.getInstance()!.addStringToSF(AppKeys.name, map['data']['uname']);
    //     SharedPref.getInstance()!.addStringToSF(AppKeys.email, map['data']['email']);
    //     SharedPref.getInstance()!.addStringToSF(AppKeys.profile, map['data']['profileImage']);
    //     SharedPref.getInstance()!.addToken(AppKeys.token, map['data']['token']);
    //     //Get.(MainScreen(currentIndex: 0));
    //
    //     Navigator.of(context).pushAndRemoveUntil(
    //         MaterialPageRoute(
    //             builder: (context) => MainScreen(
    //               currentIndex: 0,
    //
    //             )),
    //             (Route<dynamic> route) => false);
    //     // Navigator.of(context).pushReplacementNamed('/home');
    //   }else{
    //     AppWidget.hideDialog();
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             content: Text(map['message']),
    //             actions: <Widget>[
    //               // ignore: deprecated_member_use
    //               FlatButton(
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                   },
    //                   child: Text('Ok'))
    //             ],
    //           );
    //         });
    //   }
     }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (

        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                 key:_formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 110),
                          child: Image.asset(SlicingImages.logoImage),
                      ),
                      headText("Welcome!"),

                      Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 110),
                       child: SvgPicture.asset("assets/icons/pic.svg")
                      ),

                      simpleText("Profile Pic!"),

                      TextFieldWidget(
                        iconpath:'assets/icons/user.svg',
                        hint: 'Your name',
                        controller: _yournameController,
                        secure: false,
                        errMsg: "Name is required",
                      ),

                      TextFieldWidget(
                        iconpath:'assets/icons/call.svg',
                        hint: 'Mobile Number',
                        controller: _mobilenumberController,
                        secure: false,
                        errMsg: "Mobile Number is required",
                      ),
                      TextFieldWidget(
                        iconpath:'assets/icons/password.svg',
                        hint: 'Password',
                        controller: _passwordController,
                        secure: true,
                        errMsg: "Password is required",
                      ),
                      TextFieldWidget(
                        iconpath:'assets/icons/terms.svg',
                        hint: 'Employee ID',
                        controller: _mobilenumberController,
                        secure: false,
                        errMsg: "Employee ID is required",
                      ),

                      const SizedBox(
                        height: 20
                      ),

                      ButtonWidget(buttonName: 'Register',onpressed: valfn,),
                      SizedBox(height: 30,),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()
                              {
                                Get.to(const LoginScreen());
                              },
                              child: Text.rich(
                                  TextSpan(
                                      children:[
                                        TextSpan(
                                            text: "Existing User?",
                                            style:TextStyle(color: SlicingColors.texthintColor,fontSize: 16)
                                        ),
                                        TextSpan(
                                            text:"Login",
                                            style: TextStyle(color: SlicingColors.colorPrimary,fontSize: 16)
                                        )
                                      ]
                                  )),
                            ),
                          ],

                        ),
                      ),



                    ],

                  ),

                ),
              ),
            ),

          ],
        ),

        )

    );

  }

}