import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pcs/common_widget/button_widget.dart';
import 'package:pcs/common_widget/head_text_small_widget.dart';
import 'package:pcs/common_widget/head_text_widget.dart';
import 'package:pcs/common_widget/text_widget.dart';
import 'package:pcs/model/HistoryModel.dart';
import 'package:pcs/model/checkstatusmodel.dart';
import 'package:pcs/service/api_service.dart';
import 'package:pcs/utils/asset_images.dart';
import 'package:pcs/utils/color_utils.dart';
import 'package:pcs/view/home/HistoryScreen.dart';
import 'package:pcs/view/home/SettingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/app_widget.dart';
import '../../common_widget/textfield_widget.dart';
import '../../utils/SharedPref.dart';
import '../../utils/app_keys.dart';
import 'package:pcs/utils/global.dart' as global;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  String? _selectedTime="Check in time";
  String? _selectedcheckoutTime="Check out time";
  HistoryModel?history;
  Checkstatusmodel?checkstatusmodel;
  int? _checkinStatus =0;
  String? checkinAddress=null;
  String? checkoutAddress=null;
  int? checkoutstatus=null;
  String? userId;
  String? id;

  var name;
  var token;
  String? formattedDate;


  late Position currentLocation;


  APIService service = APIService(Dio());




  final TextEditingController _checkIntimeController = TextEditingController();
  final TextEditingController _checkouttimeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  /// Defaults to today's date.
  ///





  //................open time picker ....................

  final _formKey = GlobalKey<FormState>();

  void valfn() async {
    getCurrentLocation();
    if (_formKey.currentState!.validate()) {
      if(_checkinStatus==0)
        {
          print('register_response --- ${formattedDate.toString()}');
          var params = {
            'user_id': userId.toString(),
            'Restaurant_name': _nameController.text.toString(),
            'date': formattedDate.toString(),
            'checkin_time': _selectedTime.toString(),
            'checkout_time': _selectedcheckoutTime.toString(),
            'status': 1,
            "checkin_address":checkinAddress.toString(),
            "checkout_address":checkoutAddress.toString(),

          };
          checkstatusmodel = await service.checkin(params,token);
        }
      else
        {
          var params = {
            'id':id.toString(),
            'user_id': userId.toString(),
            'Restaurant_name': _nameController.text.toString(),
            'date': formattedDate.toString(),
            'checkin_time': _selectedTime.toString(),
            'checkout_time': _selectedcheckoutTime.toString(),
            'status': 2,
            "checkin_address":checkinAddress.toString(),
            "checkout_address":checkoutAddress.toString(),

          };
          checkstatusmodel = await service.checkin(params,token);
        }

      //  AppWidget.showDialogLoading();

        if (checkstatusmodel!.statusCode == 200) {
        //  AppWidget.hideDialog();
          {
            _checkinStatus=checkstatusmodel!.data!.status;
            if(_checkinStatus==1)
            {
              setState(() {
                _checkinStatus=1;
                _nameController.text=checkstatusmodel!.data!.restaurantName.toString();
                _selectedTime=checkstatusmodel!.data!.checkinTime.toString();
                checkinAddress=checkstatusmodel!.data!.checkinAddress.toString();
                formattedDate=checkstatusmodel!.data!.date.toString();
                id=checkstatusmodel!.data!.id.toString();

              });
            }
            else
            {
              setState(() {
                _checkinStatus=2;
                _nameController.clear();
                _selectedTime="Clock in time";
                _selectedcheckoutTime="Check out time";
                 id=null;
                 checkinAddress=null;
                 checkoutAddress=null;
              });
            }
          }


        }else{

        //  AppWidget.hideDialog();
          _checkinStatus=0;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(checkstatusmodel!.message.toString()),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        fixedSize: Size.fromWidth(100),
                        padding: EdgeInsets.all(10),
                      ),
                      child: Text("okay"),
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
        formattedDate = "${date.year}-${date.month}-${date.day}";
        getUserData();
        print (formattedDate);
        print("date" + currentDate.toString());
      });
    }
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


  @override
  void initState() {
    super.initState();

    getSharedData();
    getCurrentLocation();


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

                               headText(name.toString()),
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
                               Text((formattedDate).toString()),
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

                       child: Column
                         (
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           if(_checkinStatus==1)
                            Visibility(child:Align(
                              child: Column(
                                children: [
                                  headSmallText("Clock Out Details"),

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

                                ],
                              ),
                            )),




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

                        if(_checkinStatus==0)
                          ButtonWidget(buttonName: 'Clock In',onpressed: valfn)
                        else if(_checkinStatus==1)
                          ButtonWidget(buttonName: 'Clock Out',onpressed: valfn)
                        else if(_checkinStatus==2)
                          Visibility(
                            visible: true,
                            child:Text('Check in and check out for today date already done you.') ,)

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

  //....................get user details ....................

  Future<void>  getUserData() async {

    var params = {
      'user_id':userId.toString(),
      'date': formattedDate.toString(),
    };
    history = await service.checkstatus(params,token);
    if(history!.statusCode==200)
      {
         _checkinStatus=history!.data!.status;
         if(_checkinStatus==1)
           {
              setState(() {
                _nameController.text=history!.data!.restaurantName.toString();
                _selectedTime=history!.data!.checkinTime.toString();
              //  currentDate=history!.data!.date.toString() as DateTime;

              });
           }
         else
           {
             setState(() {
               _checkinStatus=2;
               // _nameController.text=history!.data!.restaurantName.toString();
               // _selectedTime=history!.data!.checkinTime.toString();
               // _selectedcheckoutTime=history!.data!.date.toString();
            //   currentDate=history!.data!.date as DateTime;
             });
           }
      }
    else
      {

        setState(() {
          _checkinStatus=0;
          _nameController.clear();
          _selectedTime="Clock in time";
          _selectedcheckoutTime="Check out time";
        });
      }




  }

   Future getSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();



    setState(() {
      var date = DateTime.parse(currentDate.toString());
      formattedDate = "${date.year}-${date.month}-${date.day}";
      userId = sharedPreferences.getString(AppKeys.userId);
      name = sharedPreferences.getString(AppKeys.name);
      token = sharedPreferences.getString(AppKeys.token);
      print('tokencccccc  -  $token');
      getUserData();
    });


  }

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) async {
      setState(() {
        global.lat = position.latitude;
        global.lng = position.longitude;
        print('LOCATION: ${global.lat} ${global.lng}');
      });
      await getAddressFromLatLng();

      //  await getNearByStore();
    }).catchError((e) {
      //  hideLoader();
      print("Exception -  base.dart - getCurrentLocation():" + e.toString());
    });
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(global.lat!, global.lng!);

      Placemark place = placemarks[0];

      setState(() {
        global.currentLocation = "${place.name}, ${place.locality} ";
      });

      setState(() {
        if(checkinAddress==null)
        {
          checkinAddress=place.name! +place.street!+ place.locality!+place.postalCode! ?? '';
        }
        else
        {
          checkoutAddress=place.name!+" " +place.street!+" " +place.locality! +place.postalCode! ?? '';
        }
      });
    } catch (e) {
      // hideLoader();
      print("Exception - base.dart - getAddressFromLatLng():" + e.toString());
    }
  }







}









