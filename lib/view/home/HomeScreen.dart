import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pcs/common_widget/button_widget.dart';
import 'package:pcs/common_widget/head_text_small_widget.dart';
import 'package:pcs/common_widget/head_text_widget.dart';
import 'package:pcs/common_widget/text_widget.dart';
import 'package:pcs/utils/asset_images.dart';
import 'package:pcs/utils/color_utils.dart';
import 'package:pcs/view/home/HistoryScreen.dart';
import 'package:pcs/view/home/SettingScreen.dart';

import '../../common_widget/textfield_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  String? _selectedTime="Check in time";
  String? _selectedcheckoutTime="Check out time";


  final TextEditingController _checkIntimeController = TextEditingController();
  final TextEditingController _checkouttimeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  /// Defaults to today's date.


  //.......................open date picker..................
   DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

//............................check in time ..........................
  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (result != null && result !='No time selected') {

      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

//....................check out time >..........................

  Future<void> _showcheckout() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (result != null && result !='No time selected') {

      setState(() {
        _selectedcheckoutTime = result.format(context);
      });
    }
  }


  //................open time picker ....................

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
           child: Stack
             (


             children: [

               Container(
                 height: MediaQuery.of(context).size.height,

                 decoration: const BoxDecoration(
                     image: DecorationImage(
                         image: AssetImage("assets/icons/bg.png"), fit: BoxFit.fill)),

                 child: SingleChildScrollView(
                   child: Form
                     (
                     key: _formKey,

                     child :Column
                       (
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,

                       children: [
                         Container(
                             margin: const EdgeInsets.symmetric(horizontal: 10.0),
                             padding: const EdgeInsets.only(top: 20,right: 15),
                           child: Row
                             (
                             crossAxisAlignment: CrossAxisAlignment.end,
                             mainAxisAlignment: MainAxisAlignment.end,


                             children: [
                               GestureDetector(
                                 onTap: ()
                                 {
                                   Get.to(const SettingScreen());
                                 },
                                child: SvgPicture.asset("assets/icons/setting.svg",alignment: Alignment.centerRight,)
                               )

                             ],

                           )
                         ),

                         Container(
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [

                               headText("Hi! Jordan"),
                               Padding(
                                   padding: const EdgeInsets.all(1),
                                   child: SvgPicture.asset("assets/icons/wave.svg",alignment: Alignment.centerRight,)
                               ),
                             ],
                           )
                         ),
                         Container(

                             margin: const EdgeInsets.symmetric(horizontal: 10.0),

                             child: Row
                               (
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 headSmallText("Clock In Details"),
                               ],

                             )
                         ),
                         Container(

                             margin: const EdgeInsets.symmetric(horizontal: 10.0),
                             padding: const EdgeInsets.only(right: 20,left: 20),
                           child: Column
                             (
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,

                             children: [
                               TextFieldWidget(
                                 iconpath:'assets/icons/location.svg',
                                 hint: 'Restaurant name',
                                 controller: _nameController,
                                 secure: false,
                                 errMsg: "Restaurant name is required",
                               ),
                             ],
                           )
                         ),
                         const SizedBox(height: 20,),
                         Container(
                           margin: const EdgeInsets.symmetric(horizontal: 30.0),
                           decoration: BoxDecoration(
                             color: SlicingColors.textbgColor,
                             borderRadius: const BorderRadius.all(Radius.circular(14)),),
                             child: Row(
                               children:[

                                 IconButton(
                                     icon: SvgPicture.asset("assets/icons/calendar.svg",width: 18.0,height: 18.0,),
                                     highlightColor: Colors.pink,
                                     onPressed: ()=> _selectDate(context),
                                   ),



                               //Text('${formatter.format(currentDate)}'),
                               Text((currentDate).toString()),
                               ],
                         ),
                           ),


                         const SizedBox(height: 20,),
                         Container(
                           margin: const EdgeInsets.symmetric(horizontal: 30.0),
                           decoration: BoxDecoration(
                             color: SlicingColors.textbgColor,
                             borderRadius: const BorderRadius.all(Radius.circular(14)),),
                           child: Row(
                             children:[

                            IconButton(
                                 icon: SvgPicture.asset("assets/icons/time.svg",width: 18.0,height: 18.0,),
                                 highlightColor: Colors.pink,
                                 onPressed: ()=> _show(),
                               ),
                               if(_selectedTime!=null)
                               Text(
                                 _selectedTime.toString(),

                               ),
                             ],
                           ),
                         ),

               

                         Container(
                             margin: const EdgeInsets.symmetric(horizontal: 10.0),
                             padding: const EdgeInsets.only(top: 20,bottom: 10),
                           child: Divider(
                           color: SlicingColors.texthintColor,
                            height: 3,
                          )),


                   Container(

                     margin: const EdgeInsets.symmetric(horizontal: 10.0),

                     child: Row
                       (
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         headSmallText("Clock Out Details"),
                       ],

                     )
                   ),

                         Container(
                           margin: const EdgeInsets.symmetric(horizontal: 30.0),
                           decoration: BoxDecoration(
                             color: SlicingColors.textbgColor,
                             borderRadius: BorderRadius.all(Radius.circular(14)),),
                           child: Row(
                             children:[

                             IconButton(
                                 icon: SvgPicture.asset("assets/icons/time.svg",width: 18.0,height: 18.0,),
                                 highlightColor: Colors.pink,
                                 onPressed: ()=> _showcheckout(),
                               ),
                               if(_selectedcheckoutTime!=null)
                                 Text(
                                   _selectedcheckoutTime.toString(),

                                 ),
                             ],
                           ),
                         ),

                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.only(top: 10,),
                    child: Row
                      (
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        ButtonWidget(buttonName: 'Clock Out',onpressed: valfn)
                      ],
                    ),
                  ),

                 Container(
                   margin: const EdgeInsets.only(top: 10.0,bottom: 20),
                   padding: const EdgeInsets.only(top: 10,bottom: 20),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,

                     children: [
                       GestureDetector(
                       onTap :()
                   {
                   Get.to(const HistoryScreen());
                   },
                         child :Row(
                           children: [
                             Padding(
                                 padding: const EdgeInsets.only(right: 10),
                                 child: SvgPicture.asset("assets/icons/doc.svg",alignment: Alignment.center,)
                             ),

                             Text('View History',
                               textAlign: TextAlign.center,
                               style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.colorPrimary,fontSize: 16 ),
                             ),
                           ],
                         )

                       ),
                    

                     ],
                   ),
                 )
                       ],
                     ),



                   )
                   ,
                 ),

               )
             ],

           ),
         ),


       );
  }



}









