import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;

  const Custombutton({
    Key? key,
    required this.text,
    required this.onPressed,
    
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.2,
      height: height * 0.09,
      decoration: BoxDecoration(
         gradient: AppGradients.primaryGradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Transparent background
          shadowColor: Colors.transparent, // Remove shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
