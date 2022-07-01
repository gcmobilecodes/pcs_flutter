import 'package:flutter/material.dart';
import 'package:pcs/common_widget/head_text_widget.dart';

Widget  headerwithback(BuildContext context, titleText) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.arrow_back),
          ),
        ),
        headText(titleText),
      ],
    ),
  );
}
