import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common_widget/button_widget.dart';
import '../../common_widget/textfield_widget.dart';
import '../../utils/color_utils.dart';
import 'SettingScreen.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState   createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen>{
  final TextEditingController _queryController = TextEditingController();
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
        return Scaffold
          (
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
                              Text('Contact Us',
                                textAlign: TextAlign.center,

                                style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 18 ),
                              )
                            ],


                          ),
                        ),

                        SizedBox(height: 20,),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SvgPicture.asset("assets/icons/contact.svg",alignment: Alignment.centerRight,)
                            ],
                          ),
                        ),

                       Container(
                         child: Column
                           (
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             TextFieldWidget(
                               iconpath:'assets/icons/terms.svg',
                               hint: 'Type your Query',
                               controller: _queryController,
                               secure: false,
                               errMsg: "Query is required",
                             ),
                           ],
                         ),
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


          ),
        ),
    ],
    ),
    ),


    );
  }
}