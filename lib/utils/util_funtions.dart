import 'package:flutter/material.dart';

import 'app_text_style.dart';

Future<TimeOfDay> pickTime(BuildContext context, TimeOfDay timme) async {
  TimeOfDay? t = await showTimePicker(context: context, initialTime: timme);
  if (t != null) {
    return t;
  } else {
    return timme;
  }
}

String formatTime(BuildContext context, TimeOfDay time) {
  final localizations = MaterialLocalizations.of(context);
  return localizations.formatTimeOfDay(time);
}


showProductLoaderDialog(BuildContext context , String title , String des) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      des,
                      style: AppTextStyle.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      });
}
