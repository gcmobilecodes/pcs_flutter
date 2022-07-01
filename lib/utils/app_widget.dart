import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'app_text_style.dart';

class AppWidget {
  static Border appBorder() {
    return Border.all(color: Colors.black, width: 1);
  }

  static void message(String message, {BuildContext? context}) {
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message,
        style: AppTextStyle.poppins(fontColor: Colors.white),
      ),
      margin: EdgeInsets.all(5),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: Colors.black,
    ));
  }


  static Widget appLoading() {
    return SpinKitFadingCircle(
    //  lineWidth: 2,
      size: 25,
      color: Colors.black,
    );
  }

  static Widget errorWidget(String errorMessage) {
    return Text(
      errorMessage,
      style:
          AppTextStyle.poppins(fontSize: 18, fontColor: Colors.black),
    );
  }

  static void showDialogLoading() {
    Get.dialog(appLoading());
  }

  static void hideDialog() {
    if (Get.isDialogOpen!) Get.back();
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
                style: AppTextStyle.poppins(fontColor: Colors.black),
              ))
        ],
      ),
      barrierDismissible: false,
    );
  }

  // static Widget imageView(String url) {
  //   return Image.network(
  //     url,
  //     fit: BoxFit.contain,
  //     loadingBuilder: (BuildContext context, Widget child,
  //         ImageChunkEvent loadingProgress) {
  //       if (loadingProgress == null) return child;
  //       return Center(
  //         child: CircularProgressIndicator.adaptive(
  //           value: loadingProgress.expectedTotalBytes != null
  //               ? loadingProgress.cumulativeBytesLoaded /
  //                   loadingProgress.expectedTotalBytes : null,
  //         ),
  //       );
  //     },
  //     errorBuilder: (context, error, stackTrace) {
  //       return Center(child: Text('No Image Found'));
  //     },
  //   );
  // }
}
