import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:checker/core/widgets/circularContainer.dart';

class TopStack extends StatelessWidget {
  final String text1;
  final String text2;

  const TopStack({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: -250,
            right: -230,
            child: CircularContainer(
              background:
                  const Color.fromARGB(255, 179, 232, 222).withOpacity(0.3),
            )),
        Positioned(
            top: -320,
            right: -100,
            child: CircularContainer(
              background:
                  const Color.fromARGB(255, 205, 228, 224).withOpacity(0.2),
            )),
        Positioned(
            top: -370,
            right: -10,
            child: CircularContainer(
              background:
                  const Color.fromARGB(255, 220, 232, 230).withOpacity(0.1),
            )),
        Positioned(
            left: 30,
            top: 110,
            child: Text(
              text1,
              style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Appcolors.whicolor),
            )),
        Positioned(
            left: 30,
            top: 140,
            child: Text(
              text2,
              style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Appcolors.kDrawerTextColor),
            ))
      ],
    );
  }
}
