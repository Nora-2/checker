// ignore_for_file: file_names

import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class customButton extends StatelessWidget {
  const customButton({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Appcolors.primarycolor,
      ),
      width: width * 0.84,
      height: height * 0.07,
      child: Center(
        child: Text(
          text,
          style:  TextStyle(
              color: Appcolors.whicolor,
              fontSize: 25,
              fontFamily: 'MulishRomanBold',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}