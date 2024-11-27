import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.background = Colors.white,
  });

  final Color background;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.96,
      height: height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: background,
      ),
    );
  }
}
