import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pcs/view/home/ContactUsScreen.dart';
import 'package:pcs/view/home/EditProfileScreen.dart';

import '../../utils/color_utils.dart';
import '../auth/LoginScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState  createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  void valfn() async {
    if (_formKey.currentState!.validate()) {
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
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: _formKey,
                  child: Column
                    (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20,left: 14),
                        padding: const EdgeInsets.only(top:20,left:14),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap :()
                                  {
                                     Navigator.pop(context);
                                  },
                                child: SvgPicture.asset("assets/icons/back.svg",alignment: Alignment.centerRight,)
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row
                          (
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Settings',
                              textAlign: TextAlign.center,

                              style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 18 ),
                            )
                          ],


                        ),
                      ),
                     SizedBox(height: 20,),
                     Container(
                       margin: const EdgeInsets.only(right: 20,left: 20,top: 10),
                       padding: const EdgeInsets.all(15),
                       decoration: BoxDecoration(
                           border: Border.all(color: SlicingColors.whitesmoke,width: 1,),
                            borderRadius: BorderRadius.circular(10.0),
                       ),


                       child: Row(  

                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           GestureDetector(
                             onTap: ()
                             {
                              Get.to(const EditProfileScreen());
                             },
                             child:Row(
                               children: [
                                 Padding(
                                     padding: const EdgeInsets.only(right: 20,left: 10),
                                     child: SvgPicture.asset("assets/icons/user.svg",alignment: Alignment.center,)
                                 ),
                                 Text('Edit Profile',
                                   textAlign: TextAlign.left,
                                   style:TextStyle(color: SlicingColors.textColor,fontSize: 16 ),
                                 ),

                               ],
                             ),

                           ),

                           Spacer(),
                           Padding(
                             padding: const EdgeInsets.all(1),
                             child: SvgPicture.asset("assets/icons/next.svg",),
                           ),

                         ],
                       ),

                     ),
                      Container(
                        margin: const EdgeInsets.only(right: 20,left: 20,top: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: SlicingColors.whitesmoke,width: 1,),
                          borderRadius: BorderRadius.circular(10.0),
                        ),


                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: ()
                              {
                                Get.to(const ContactUsScreen());
                              },
                              child:Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 20,left: 10),
                                      child: SvgPicture.asset("assets/icons/call.svg",alignment: Alignment.center,)
                                  ),
                                  Text('Contact Us',
                                    textAlign: TextAlign.left,
                                    style:TextStyle(color: SlicingColors.textColor,fontSize: 16 ),
                                  ),

                                ],
                              ),

                            ),

                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: SvgPicture.asset("assets/icons/next.svg",),
                            ),

                          ],
                        ),

                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20,left: 20,top: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: SlicingColors.whitesmoke,width: 1,),
                          borderRadius: BorderRadius.circular(10.0),
                        ),


                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: ()
                              {

                              },
                              child:Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 20,left: 10),
                                      child: SvgPicture.asset("assets/icons/terms.svg",alignment: Alignment.center,)
                                  ),
                                  Text('Terms & Conditions',
                                    textAlign: TextAlign.left,
                                    style:TextStyle(color: SlicingColors.textColor,fontSize: 16 ),
                                  ),

                                ],
                              ),

                            ),

                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: SvgPicture.asset("assets/icons/next.svg",),
                            ),

                          ],
                        ),

                      ),

                      SizedBox(height: 70,),

                      Container(
                        child: Row
                          (
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                            onTap: ()
                            {
                                Get.to(const LoginScreen());
                             },
                        child:Column(
                          children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: SvgPicture.asset("assets/icons/logout.svg",),
                                  ),
                                  SizedBox(height: 14,),
                                  Text('   Log Out',
                                    textAlign: TextAlign.left,
                                    style:TextStyle(color: SlicingColors.colorgreen,fontSize: 16 ),
                                  ),
                          ],
                            ),
                            )

                          ],
                        ),
                      )


                    ],
                  ),

                ),

              ),
            ],
          ),
        ),


      );
  }
}