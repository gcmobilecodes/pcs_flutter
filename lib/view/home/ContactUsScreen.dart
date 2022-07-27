import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pcs/model/contact.dart';
import 'package:pcs/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/app_widget.dart';
import '../../common_widget/button_widget.dart';
import '../../common_widget/textfield_widget.dart';
import '../../utils/app_keys.dart';
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
  Contact?contact;
  APIService service = APIService(Dio());
  var token;
  void valfn() async {
    if (_formKey.currentState!.validate()) {
      AppWidget.showDialogLoading();
      var params = {
        'Query': _queryController.text.toString(),
      };
      contact = await service.contactUs(params,token);
      if (contact!.statusCode == 200) {
        AppWidget.hideDialog();
        Navigator.pop(context);
      }

      else {
        AppWidget.hideDialog();
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(contact!.message.toString()),
                actions: <Widget>[

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      fixedSize: Size.fromWidth(100),
                      padding: EdgeInsets.all(10),
                    ),
                    child: Text("Okay"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    }
  }
  @override
  void initState() {
    super.initState();
    getSharedData();

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

  Future<void> getSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      token = sharedPreferences.getString(AppKeys.token);
      print('tokencccccc  -  $token');
    });
  }
}