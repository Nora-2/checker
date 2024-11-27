import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appimage/app_images.dart';
import 'package:checker/core/utilis/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:checker/features/home/presentation/home.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            Appimage.scan,
            height: height * 0.4,
            width: width * 0.8,
          ),
           sized.s20,
           Text(
            'Welcome To Price Checker App',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Appcolors.backcolor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.01),
            child:  Text(
              'Our app helps you to easily scan different products \n             view price , brand , description..... ',
              style: TextStyle(
                fontSize: 14,
                color: Appcolors.kDrawerTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      nextScreen: const HomeScreen(),
      splashIconSize: height * 0.9,
      duration: 500,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Appcolors.whicolor,
    );
  }
}
