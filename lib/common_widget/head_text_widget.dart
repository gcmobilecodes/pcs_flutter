import 'package:flutter/cupertino.dart';
import 'package:pcs/utils/color_utils.dart';
// import 'package:google_fonts/google_fonts.dart';


Widget headText(headText) {
  return Container(
    padding: const EdgeInsets.all(23),
    child: Text(
      headText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: SlicingColors.textColor,
        fontSize: 24,
      ),

    ),
  );
}
