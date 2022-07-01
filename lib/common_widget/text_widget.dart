import 'package:flutter/cupertino.dart';
import 'package:pcs/utils/color_utils.dart';
// import 'package:google_fonts/google_fonts.dart';


Widget simpleText(headText) {
  return Container(
    padding: const EdgeInsets.all(23),
    child: Text(
      headText,
      style: TextStyle(fontWeight: FontWeight.normal,color: SlicingColors.texthintColor,fontSize: 16),
      // style: GoogleFonts.poppins(
      //   textStyle: TextStyleConstants.headStyle,
      // ),
    ),
  );
}
