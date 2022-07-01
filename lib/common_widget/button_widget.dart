import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcs/utils/color_utils.dart';
// import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final void Function()? onpressed;

  const ButtonWidget({
    Key? key,
    required this.buttonName,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
          alignment: Alignment.center,
          height: 48,
          width: 193,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: SlicingColors.colorgreen,
          ),
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,fontSize: 18,
            ),
          )),
    );
  }
}

class ButtonWidget2 extends StatelessWidget {
  final String buttonName;
  final void Function()? onpressed;

  const ButtonWidget2({
    Key? key,
    required this.buttonName,
    this.onpressed,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
          alignment: Alignment.center,
          height: 48,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: SlicingColors.colorPrimary),
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
          child: Text(
            buttonName,
            style: TextStyle(color: SlicingColors.colorPrimary),
          )),
    );
  }
}
