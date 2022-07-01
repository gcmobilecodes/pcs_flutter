import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pcs/common_widget/button_widget.dart';
import 'package:pcs/common_widget/head_text_widget.dart';
import 'package:pcs/common_widget/textfield_widget.dart';
import 'package:pcs/utils/asset_images.dart';
import 'package:pcs/utils/color_utils.dart';
import 'package:pcs/view/auth/SignupScreen.dart';
import 'package:pcs/view/home/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
        child: Stack
          (
          children: [
           Container(
             height: MediaQuery.of(context).size.height,
             margin: const EdgeInsets.symmetric(horizontal: 10.0),
             padding: const EdgeInsets.all(20),
             child: SingleChildScrollView(
               child: Form
                 (
                   key: _formKey,
                   child: Column(

                     crossAxisAlignment: CrossAxisAlignment.center,

                     children: [
                     SizedBox(
                         height: 40,
                     ),

                     Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 110),
                       child: Image.asset(SlicingImages.logoImage),
                       // child: SvgPicture.asset("assets/icons/callmobile.svg",width: 18.0,
                       //   height: 18.0,)
                      ),
                       
                       headText(" Welcome back!"),
                       const SizedBox(
                         height: 41,
                       ),
                       TextFieldWidget(
                         iconpath:'assets/icons/call.svg',
                         hint: 'Mobile Number',
                         controller: _mobileNumberController,
                         secure: false,
                         errMsg: "Mobile Number is required",
                       ),

                       SizedBox(
                         height: 10,
                       ),
                       TextFieldWidget(
                         iconpath:'assets/icons/password.svg',
                         hint: 'Password',
                         controller: _passwordController,
                         secure: true,
                         errMsg: "Password is required",
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       GestureDetector(
                         onTap:() {
                            //Get.to(LoginScreen());
                         },
                         child: Align(
                           alignment: Alignment.centerRight,
                         child: Text(
                             "Forget Passoword?",
                           style: TextStyle(color:SlicingColors.colorPrimary),

                         ),
                       )
                       ),
                       const SizedBox(
                         height: 40,
                       ),
                       ButtonWidget(buttonName: 'Login',onpressed: valfn),
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
                                 Get.to(const SignupScreen());
                               },
                               child: Text.rich(
                                   TextSpan(
                                       children:[
                                         TextSpan(
                                             text: "New user?",
                                             style:TextStyle(color: SlicingColors.texthintColor,fontSize: 16)
                                         ),
                                         TextSpan(
                                             text:"Register",
                                             style: TextStyle(color: SlicingColors.colorPrimary,fontSize: 16)
                                         )
                                       ]
                                   )),
                             ),
                           ],

                         ),
                       ),


                     ],


               )




          )

      ),


    ),


  ],
    ),
    ),
    );

  }

}