import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appimage/app_images.dart';
import 'package:flutter/material.dart';
import 'package:checker/features/home/presentation/home.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedSplashScreen(
        splash: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.09),
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.6,
                  child: Image.asset(
                    Appimage.welcome ,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Text(
                  'Welcome To Price Checker App!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.backcolor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text(
                  'Our app helps you to easily scan different products \n           view price , brand , description and more',
                  style: TextStyle(
                    fontSize: 20,
                    color: Appcolors.kDrawerTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        nextScreen: const HomeScreen(),
        splashIconSize: height * 0.9,
        duration: 500,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Appcolors.whicolor,
      ),
    );
  }
}
