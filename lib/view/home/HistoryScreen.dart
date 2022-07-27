import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pcs/view/home/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/app_widget.dart';
import '../../common_widget/button_widget.dart';
import '../../common_widget/textfield_widget.dart';
import '../../model/HistoryModel.dart';
import '../../service/api_service.dart';
import '../../utils/app_keys.dart';
import '../../utils/color_utils.dart';
import 'SettingScreen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState  createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>{
  String? _selectedTime="";
  String? _selectedcheckoutTime="";
  HistoryModel?history;
  int? _checkinStatus =0;
  String? checkinAddress=null;
  String? checkoutAddress=null;
  String? userId;
  var name;
  var token;
  String? selectedDate;
  final TextEditingController _datecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  APIService service = APIService(Dio());
  void valfn() async {
    if (_formKey.currentState!.validate()) {
          getUserData();

    }
  }

  //.......................open date picker..................
  late DateTime currentDate=DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        var date = DateTime.parse(pickedDate.toString());
        selectedDate = "${date.year}-${date.month}-${date.day}";
        _datecontroller.text=selectedDate.toString();

        print (selectedDate);
        print("date" + currentDate.toString());
      });
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
                            Text('History',
                              textAlign: TextAlign.center,

                              style:TextStyle(fontWeight: FontWeight.bold,color: SlicingColors.textColor,fontSize: 18 ),
                            )
                          ],


                        ),
                      ),

                      SizedBox(height: 20,),


                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
                            Text((selectedDate).toString()),
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

                      if(_checkinStatus==1 || _checkinStatus==2)

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
                                        child: Text(name.toString(),
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
                                        child: Text(selectedDate.toString(),
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
                                              child: Text(_selectedTime.toString(),
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
                                              child: Text(_selectedcheckoutTime.toString(),
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

                      if(_checkinStatus==0)

                        Text('Their is no check in/check out for today',
                          textAlign: TextAlign.center,
                          style:TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.colorPrimary,fontSize: 22 ),
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

  Future getSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();



    setState(() {
      var date = DateTime.parse(currentDate.toString());
      selectedDate = "${date.year}-${date.month}-${date.day}";
      _datecontroller.text=selectedDate.toString();
      userId = sharedPreferences.getString(AppKeys.userId);
      name = sharedPreferences.getString(AppKeys.name);
      token = sharedPreferences.getString(AppKeys.token);
      print('tokencccccc  -  $token');
      getUserData();
    });


  }

  //....................get user details ....................

  Future<void>  getUserData() async {
    AppWidget.showDialogLoading();
    var params = {
      'user_id':userId.toString(),
      'date': selectedDate.toString(),
    };
    history = await service.checkstatus(params,token);
    if(history!.statusCode==200)
    {
      AppWidget.hideDialog();


       setState(() {
         name=history!.data!.restaurantName.toString();
         _selectedTime=history!.data!.checkinTime.toString();
         _selectedcheckoutTime=history!.data!.checkoutTime.toString();
         _checkinStatus=history!.data!.status;
         selectedDate=history!.data!.date.toString();
       });
    }
    else
    {

      AppWidget.hideDialog();

      setState(() {
         _checkinStatus=0;
      });
    }




  }
}