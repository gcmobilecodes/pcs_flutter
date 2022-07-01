
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget {
  static Border appBorder() {
    return Border.all(color: Colors.black, width: 1);
  }

  static void message(String message, {BuildContext? context}) {
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message,
       // style: AppTextStyle.playfairTextStyle(fontColor: Colors.white),
      ),
      margin: EdgeInsets.all(5),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: Colors.black,
    ));
  }


  // static Widget appLoading() {
  //   return SpinKitDualRing(
  //     lineWidth: 2,
  //     size: 25,
  //     color: Colors.black,
  //   );
  // }

  static Widget errorWidget(String errorMessage) {
    return Text(
      errorMessage,
      // style:
      //     AppTextStyle.playfairTextStyle(fontSize: 18, fontColor: Colors.black),
    );
  }

  static void showDialogLoading() {
   // Get.dialog(appLoading());
  }

  static void hideDialog() {
    //if (Get!.isDialogOpen) Get.back();
  }

  static Future showSimplesDialog(BuildContext context, String title, String content, String buttonText, VoidCallback callback) {
    return Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: callback.call,
              child: Text(
                buttonText,
                //style: AppTextStyle.playfairTextStyle(fontColor: Colors.black),
              ))
        ],
      ),
      barrierDismissible: false,
    );
  }


}
