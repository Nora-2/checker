import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appicons/app_icons.dart';
import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  final String label;
  final String value;

  const Output({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(
          Appicons.star,
          color: Appcolors.secondarycolor,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        Text(
            value,
            style:  TextStyle(
              color: Appcolors.secondarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              overflow: TextOverflow.ellipsis,
            ),
          
        )
      ],
    );
  }
}
