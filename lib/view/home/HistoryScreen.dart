import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pcs/view/home/HomeScreen.dart';

import '../../common_widget/button_widget.dart';
import '../../common_widget/textfield_widget.dart';
import '../../utils/color_utils.dart';
import 'SettingScreen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState  createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>{
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
                            Text('History',
                              textAlign: TextAlign.center,

                              style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 18 ),
                            )
                          ],


                        ),
                      ),

                      SizedBox(height: 20,),


                      Container(
                        child: Column
                          (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFieldWidget(
                              iconpath:'assets/icons/calendar.svg',
                              hint: 'Select Date',
                              controller: _queryController,
                              secure: false,
                              errMsg: "Date is required",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height: 20
                            ),

                            ButtonWidget(buttonName: 'Search Details',onpressed: valfn,),

                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 30),

                        child: Column
                          (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Clock In/Clock Out Details',
                          textAlign: TextAlign.center,
                              style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.textColor,fontSize: 16 ),
                            ),
                            SizedBox(height: 10),
                            Divider(
                              color: SlicingColors.texthintColor,
                              height: 3,
                            ),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/icons/location.svg",alignment: Alignment.topCenter,),
                                  Padding(padding: const EdgeInsets.only(left: 10,top: 2),
                                   child: Text('The Capital Grille ',
                                      textAlign: TextAlign.start,
                                      style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.textColor,fontSize: 16 ),
                                    ),),


                                ],

                              ),
                            ),

                            SizedBox(height: 16),
                            Container(
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/icons/calendar.svg",alignment: Alignment.topCenter,),
                                  Padding(padding: const EdgeInsets.only(left: 10,top: 2),
                                    child: Text('11-03-2021',
                                      textAlign: TextAlign.start,
                                      style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.textColor,fontSize: 16 ),
                                    ),),


                                ],

                              ),
                            ),

                            SizedBox(height: 20,),

                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text('Clock In',
                                textAlign: TextAlign.start,
                                style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.textColor,fontSize: 16 )),
                                Spacer(),
                              Text('Clock Out',
                                textAlign: TextAlign.start,
                                style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.textColor,fontSize: 16 ),),

                                ],
                              ),
                            ),
                            SizedBox(height: 20,),

                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset("assets/icons/time.svg",alignment: Alignment.center,),
                                        Padding(padding: const EdgeInsets.only(left: 5),
                                          child: Text('11-03-2021',
                                            textAlign: TextAlign.start,
                                            style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.textColor,fontSize: 16 ),
                                          ),),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset("assets/icons/time.svg",alignment: Alignment.center,),
                                        Padding(padding: const EdgeInsets.only(left: 5),
                                          child: Text('11-03-2021',
                                            textAlign: TextAlign.start,
                                            style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.textColor,fontSize: 16 ),
                                          ),),
                                      ],
                                    ),
                                  ),



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