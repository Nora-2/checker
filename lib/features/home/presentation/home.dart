import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appicons/app_icons.dart';
import 'package:checker/features/home/controller/home_controller.dart';
import 'package:checker/features/management/views/management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checker/core/widgets/Textformfield.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isScreenIgnored = true; // Initially, the screen is non-interactive

  void _showPasswordDialog() {
    final TextEditingController passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('enterPassword'.tr),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration:  InputDecoration(hintText: 'password'.tr),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:  Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text == '1234') {
                  // Replace 'your_password' with your actual password
                  setState(() {
                    _isScreenIgnored = false; // Enable interactivity
                  });
                   Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const Management(),
                            ),
                          );
                  
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('incorrecpassword'.tr)),
                  );
                }
              },
              child:  Text('submit'.tr),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Appcolors.homeBack,
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: _isScreenIgnored,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    height: height,
                    width: width * 0.35,
                    decoration: const BoxDecoration(
                      gradient: AppGradients.primaryGradient,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.20,
                  left: width * 0.05,
                  child:  Text(
                    'scanHere'.tr,
                    style:const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.25,
                  left: width * 0.05,
                  child:  Text(
                    'scanningInProgress'.tr,
                    style:const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.10,
            left: width * 0.3,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  _isScreenIgnored = true; // Disable interactivity
                });
              },
              onTap: _showPasswordDialog,
              child: const Icon(
                size: 40.0,
                  color: Colors.red, Icons.settings_accessibility),
            ),
          ),
          Stack(
            children: [
              IgnorePointer(
                ignoring: _isScreenIgnored,
                child: Stack(
                  children: [
                    Positioned(
                      left: width * 0.35,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        height: height,
                        width: width * 0.66,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.28,
                      left: width * 0.57,
                      child: SizedBox(
                        width: width * 0.3,
                        height: height * 0.2,
                        child: CustomFormField(
                          hint: 'enterCode'.tr,
                          preicon: Icon(Appicons.barcode),
                          ispass: false,
                          controller: controller.barcodeController,
                          onsubmit: (p0) {
                            controller.handleBarcodeSubmit(context);
                            controller.barcodeController.clear();
                          },
                        ),
                      ),
                    ),
                   
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: height * 0.6,
            left: width * 0.18,
            child: Transform.rotate(
              angle: 0,
              child: Lottie.asset(
                'assets/Lottie/Scan.json',
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
