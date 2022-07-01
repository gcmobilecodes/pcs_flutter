import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pcs/utils/color_utils.dart';
import 'package:pcs/view/home/SettingScreen.dart';

import '../../common_widget/button_widget.dart';
import '../../common_widget/head_text_small_widget.dart';
import '../../common_widget/textfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState   createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _yournameController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
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
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key :_formKey,
                  child: Column
                    (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                         Container(

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
                             Text('Edit Profile',
                               textAlign: TextAlign.center,

                               style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 18 ),
                             )
                           ],


                         ),
                       ),

                       Container(
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [

                             Image.asset("assets/icons/profile.png"),
                           ],
                         ),
                       ),
                       
                       SizedBox(height: 20,),

                       Container(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text('Name',
                               textAlign: TextAlign.center,

                               style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 16 ),
                             ),
                             TextFieldWidget(
                               iconpath:'assets/icons/user.svg',
                               hint: 'Name',
                               controller: _yournameController,
                               secure: false,
                               errMsg: "Name is required",
                             ),
                             SizedBox(height: 10,),
                             Text('Mobile',
                               textAlign: TextAlign.center,

                               style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 16 ),
                             ),

                             TextFieldWidget(
                               iconpath:'assets/icons/call.svg',
                               hint: 'Mobile Number',
                               controller: _mobilenumberController,
                               secure: false,
                               errMsg: "Mobile Number is required",
                             ),
                             SizedBox(height: 10,),
                             Text('Employee ID',
                               textAlign: TextAlign.center,

                               style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 16 ),
                             ),

                             TextFieldWidget(
                               iconpath:'assets/icons/terms.svg',
                               hint: 'Employee ID',
                               controller: _mobilenumberController,
                               secure: false,
                               errMsg: "Employee ID is required",
                             ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                    height: 20
                                ),

                                ButtonWidget(buttonName: 'Save Changes',onpressed: valfn,),

                              ],
                            ),
                          )



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
      ),


    );

  }
}