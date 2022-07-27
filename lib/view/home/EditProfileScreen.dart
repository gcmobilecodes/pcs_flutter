

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcs/utils/color_utils.dart';
import 'package:pcs/view/home/SettingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/app_widget.dart';
import '../../common_widget/button_widget.dart';
import '../../common_widget/custom_surfix_icon.dart';
import '../../common_widget/head_text_small_widget.dart';
import '../../common_widget/textfield_widget.dart';
import '../../model/updateProfile.dart';
import '../../service/api_service.dart';
import '../../utils/app_keys.dart';
import 'package:dio/dio.dart' as d;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState   createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _yournameController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  String? userId;
  String? name;
  String? profilepic;
  String? mobilenumber;
  String? employeid;
  UpdateProfile?updateProfile;
  var token;
  File? _selectedImage;
  final _picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  late SharedPreferences shared;
  APIService service = APIService(Dio());

  void valfn() async {
    if (_formKey.currentState!.validate()) {
        AppWidget.showDialogLoading();
            var formData = d.FormData.fromMap({
              'name': _yournameController.text,
              'profile_pic': null,
              'mobile_number': mobilenumber.toString(),
              'employee_id': _employeeController.text,
            });
            updateProfile = await service.updateProfile(formData,token);

        if (updateProfile!.statusCode == 200) {
          AppWidget.hideDialog();
          setState(() {
            _yournameController.text = updateProfile!.data!.name.toString();
            mobilenumber =
                updateProfile!.data!.mobileNumber.toString();
            _employeeController.text = updateProfile!.data!.employeeId.toString();
            print('tokencccccc  -  $token');
            shared.setString(AppKeys.name, updateProfile!.data!.name.toString());
            shared.setString(AppKeys.mobile, updateProfile!.data!.mobileNumber.toString());
            shared.setString(
                AppKeys.employee_id, updateProfile!.data!.employeeId.toString());
          });


        } else {
          AppWidget.hideDialog();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Please try again'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Ok'))
                  ],
                );
              });
        }
      }
    }


  Future getCoverImage() async {
    try {
      XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
      print('image -- ${imageFile!.path}');
      if (imageFile != null) {
        print('image -- ${imageFile.path}');
        setState(() {
          _selectedImage =File(imageFile.path);
        });
      }else{
        print('null');
      }
    } catch (error) {
      print('error: $error');
    }

  }

  @override
  void initState() {
    super.initState();
    getSharedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column
                    (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset("assets/icons/back.svg",
                                  alignment: Alignment.centerRight,)
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row
                          (
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Edit Profile',
                              textAlign: TextAlign.center,

                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: SlicingColors.textColor,
                                  fontSize: 18),
                            )
                          ],


                        ),
                      ),
                      SizedBox(height: 20,),

                      // Container(
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       _selectedImage != null ? Container(
                      //         width: 130,
                      //         height: 130,
                      //         child: Stack(
                      //           children: [
                      //             Container(
                      //               width: double.infinity,
                      //               height: 150,
                      //               decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(80.0),
                      //                   image: DecorationImage(
                      //                       image: FileImage(_selectedImage!),
                      //                       fit: BoxFit.cover
                      //                   )
                      //               ),
                      //             ),
                      //
                      //             Align(
                      //               alignment: Alignment.topRight,
                      //               child: Padding(
                      //                 padding:
                      //                 const EdgeInsets.only(
                      //                     top: 2.0),
                      //                 child: GestureDetector(
                      //                   onTap: () {
                      //                     setState(() {
                      //                       _selectedImage!.path.removeAllWhitespace;
                      //                       _selectedImage = null;
                      //                     });
                      //
                      //                   },
                      //                   child: CustomSuffixIcon(
                      //                     svgIcon:
                      //                     'assets/icons/removeIcon.svg',
                      //                     size: 25,
                      //                   ),
                      //                 ),
                      //               ),
                      //             )
                      //
                      //
                      //
                      //           ],
                      //         ),
                      //       ):GestureDetector(onTap: ()
                      //       {
                      //         getCoverImage();
                      //       },
                      //         child: Container(
                      //           child: Column(
                      //             children: [
                      //               if(profilepic!=null)...[
                      //
                      //                 Container(
                      //                   width: 150,
                      //                   height: 150,
                      //                   decoration: BoxDecoration(
                      //                       borderRadius: BorderRadius.circular(80.0),
                      //                       image: DecorationImage(
                      //                       image: NetworkImage(AppKeys.IMAGE_URL+profilepic.toString()),
                      //                       //whatever image you can put here
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ]
                      //               else...
                      //                 [
                      //                   Padding(
                      //                       padding:const EdgeInsets.symmetric(horizontal: 110),
                      //                       child: SvgPicture.asset("assets/icons/pic.svg")
                      //                   ),
                      //                 ]
                      //
                      //
                      //             ],
                      //           ),
                      //         )
                      //
                      //
                      //       ),
                      //
                      //
                      //     ],
                      //   ),
                      // ),

                      SizedBox(height: 50,),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Name',
                              textAlign: TextAlign.center,

                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: SlicingColors.textColor,
                                  fontSize: 16),
                            ),
                            TextFieldWidget(
                              iconpath: 'assets/icons/user.svg',
                              hint: 'Name',
                              controller: _yournameController,
                              secure: false,
                              errMsg: "Name is required",
                            ),
                            SizedBox(height: 10,),
                            Text('Mobile',
                              textAlign: TextAlign.center,

                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: SlicingColors.textColor,
                                  fontSize: 16),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                color: SlicingColors.textbgColor,
                                borderRadius: const BorderRadius.all(Radius.circular(14)),),
                              child: Row(
                                children:[
                                  Padding(
                                      padding:const EdgeInsets.all(16),
                                      child: SvgPicture.asset("assets/icons/time.svg",width: 18.0,height: 18.0,),
                                  ),

                                  Text(mobilenumber.toString()),

                                ],
                              ),
                            ),

                            // TextFieldWidget(
                            //   iconpath: 'assets/icons/call.svg',
                            //   hint: 'Mobile Number',
                            //   controller: _mobilenumberController,
                            //   secure: false,
                            //   errMsg: "Mobile Number is required",
                            // ),
                            SizedBox(height: 10,),
                            Text('Employee ID',
                              textAlign: TextAlign.center,

                              style: TextStyle(fontWeight: FontWeight.bold,
                                  color: SlicingColors.textColor,
                                  fontSize: 16),
                            ),

                            TextFieldWidget(
                              iconpath: 'assets/icons/terms.svg',
                              hint: 'Employee ID',
                              controller: _employeeController,
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

                                  ButtonWidget(buttonName: 'Save Changes',
                                    onpressed: valfn,),

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


  Future getSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


    setState(() {
      userId = sharedPreferences.getString(AppKeys.userId);
      _yournameController.text = sharedPreferences.getString(AppKeys.name)!;
      token = sharedPreferences.getString(AppKeys.token);
      profilepic = sharedPreferences.getString(AppKeys.profile_pic);
      mobilenumber =
      sharedPreferences.getString(AppKeys.mobile)!;
      _employeeController.text =
      sharedPreferences.getString(AppKeys.employee_id)!;
      print('tokencccccc  -  $token');
    });
  }
}

