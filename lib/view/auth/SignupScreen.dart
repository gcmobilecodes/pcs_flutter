import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pcs/common_widget/button_widget.dart';
import 'package:pcs/common_widget/head_text_widget.dart';
import 'package:pcs/common_widget/text_widget.dart';
import 'package:pcs/common_widget/textfield_widget.dart';
import 'package:pcs/model/signup_model.dart';
import 'package:pcs/utils/asset_images.dart';
import 'package:pcs/utils/color_utils.dart';
import 'package:pcs/view/auth/LoginScreen.dart';

import '../../common_widget/app_widget.dart';
import '../../common_widget/custom_surfix_icon.dart';
import '../../service/api_service.dart';
import 'package:dio/dio.dart' as d;
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _yournameController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  File? _selectedImage;
  APIService service = APIService(Dio());
  SignupModel?register;
  void valfn() async {
    if (_formKey.currentState!.validate()) {

         AppWidget.showDialogLoading();
        var formData = d.FormData.fromMap({
          'name': _yournameController.text,
          'mobile_number': _mobilenumberController.text,
          'profile_pic': "",
          'password': _passwordController.text,
          'employee_id': _employeeController.text,
          'user_type': 1,

        });

        print('params   -   ${formData.files}');
        register = await service.register(formData);

        if (register!.statusCode == 200) {
          AppWidget.hideDialog();

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false);
          Navigator.of(context).pushReplacementNamed('/signup');
        } else {
          AppWidget.hideDialog();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(register!.message.toString()),
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
      // else {
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           content: Text('Please select a cover image.'),
      //           actions: <Widget>[
      //             // ignore: deprecated_member_use
      //             ElevatedButton(
      //                 onPressed: () {
      //                   Navigator.of(context).pop();
      //                 },
      //                 child: Text('Ok'))
      //           ],
      //         );
      //       });
      // }
    }

  // Future getCoverImage() async {
  //   try {
  //     XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
  //     print('image -- ${imageFile!.path}');
  //     if (imageFile != null) {
  //       print('image -- ${imageFile.path}');
  //       setState(() {
  //         _selectedImage =File(imageFile.path).absolute;
  //       });
  //
  //
  //       // if (cropppedImageFile != null) {
  //       //   Media _media = new Media('image', XFile(cropppedImageFile!.path), '');
  //       //   if (widget.mediaFiles?.length == 0) {
  //       //     setState(() {
  //       //       _previewMedia = _media;
  //       //     });
  //       //   }
  //       //   setState(() {
  //       //     widget.mediaFiles?.add(_media);
  //       //     // if (_listKey.currentState != null) {
  //       //     //  // _listKey.currentState!.insertItem(0, duration: Duration(seconds: 2));
  //       //     // }
  //       //   });
  //       // }
  //       //
  //     }else{
  //       print('null');
  //     }
  //   } catch (error) {
  //     print('error: $error');
  //   }
  //   // FilePickerResult? pickedFile = await FilePicker.platform
  //   //     .pickFiles(allowMultiple: false, type: FileType.image);
  //   // setState(() {
  //   //   if (pickedFile != null) {
  //   //
  //   //     coverImage = pickedFile.paths.map((path) => File(path!)).toList();
  //   //     for (int i = 0; i < coverImage.length; i++) {
  //   //       _selectedCoverImage = coverImage[i];
  //   //
  //   //     }
  //   //    // upload(_selectedImage!.path);
  //   //   } else {
  //   //     print('No image selected.');
  //   //   }
  //   // });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (

        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                 key:_formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 20),


                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 110),
                        child: Image.asset(SlicingImages.logoImage),
                      ),

                          headText("Welcome!"),
                      SizedBox(height: 40),
                      // _selectedImage != null ? Container(
                      //   width: 130,
                      //   height: 130,
                      //   child: Stack(
                      //     children: [
                      //       Container(
                      //         width: double.infinity,
                      //         height: 150,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(80.0),
                      //             image: DecorationImage(
                      //                 image: FileImage(_selectedImage!),
                      //                 fit: BoxFit.cover
                      //             )
                      //         ),
                      //       ),
                      //
                      //       Align(
                      //         alignment: Alignment.topRight,
                      //         child: Padding(
                      //           padding:
                      //           const EdgeInsets.only(
                      //               top: 2.0),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               setState(() {
                      //                 _selectedImage!.path.removeAllWhitespace;
                      //                 _selectedImage = null;
                      //               });
                      //
                      //             },
                      //             child: CustomSuffixIcon(
                      //               svgIcon:
                      //               'assets/icons/removeIcon.svg',
                      //               size: 25,
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //
                      //
                      //
                      //     ],
                      //   ),
                      // ):GestureDetector(onTap: ()
                      //    {
                      //         getCoverImage();
                      //     },
                      //        child: Padding(
                      //            padding:const EdgeInsets.symmetric(horizontal: 110),
                      //            child: SvgPicture.asset("assets/icons/pic.svg")
                      //        ),
                      //    ),
                      //
                      //
                      //
                      // simpleText("Profile Pic!"),

                      TextFieldWidget(
                        iconpath:'assets/icons/user.svg',
                        hint: 'Your name',
                        controller: _yournameController,
                        secure: false,
                        errMsg: "Name is required",
                      ),

                      TextFieldWidget(
                        iconpath:'assets/icons/call.svg',
                        hint: 'Mobile Number',
                        controller: _mobilenumberController,
                        secure: false,
                        errMsg: "Mobile Number is required",
                      ),
                      TextFieldWidget(
                        iconpath:'assets/icons/password.svg',
                        hint: 'Password',
                        controller: _passwordController,
                        secure: true,
                        errMsg: "Password is required",
                      ),
                      TextFieldWidget(
                        iconpath:'assets/icons/terms.svg',
                        hint: 'Employee ID',
                        controller: _employeeController,
                        secure: false,
                        errMsg: "Employee ID is required",
                      ),

                      const SizedBox(
                        height: 20
                      ),

                    ButtonWidget(buttonName: 'Register',onpressed: valfn,),
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
                                Get.to(const LoginScreen());
                              },
                              child: Text.rich(
                                  TextSpan(
                                      children:[
                                        TextSpan(
                                            text: "Existing User?",
                                            style:TextStyle(color: SlicingColors.texthintColor,fontSize: 16)
                                        ),
                                        TextSpan(
                                            text:"Login",
                                            style: TextStyle(color: SlicingColors.colorPrimary,fontSize: 16)
                                        )
                                      ]
                                  )),
                            ),
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

        )

    );

  }

}