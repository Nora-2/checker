import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appicons/app_icons.dart';
import 'package:checker/features/home/controller/home_controller.dart';
import 'package:checker/features/management/views/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checker/core/widgets/Textformfield.dart';
import 'package:checker/core/widgets/topStack.dart';

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
          title: const Text('Enter Password'),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text == '1234') {
                  // Replace 'your_password' with your actual password
                  setState(() {
                    _isScreenIgnored = false; // Enable interactivity
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect password')),
                  );
                }
              },
              child: const Text('Submit'),
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
      backgroundColor:  Appcolors.secondarycolor,
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: _isScreenIgnored,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Appcolors.secondarycolor,
                    child: SizedBox(
                      width: width,
                      height: height * 0.23,
                      child: const TopStack(
                          text1: 'Scan Here!', text2: 'Scanning in Progress'),
                    ),
                  ),
                  Container(
                    height: height * 0.77,
                    width: width,
                    decoration:  BoxDecoration(
                      color: Appcolors.whicolor,
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CustomFormField(
                            hint: 'Enter code',
                            preicon:  Icon(Appicons.barcode),
                            ispass: false,
                            controller: controller.barcodeController,
                            onsubmit: (p0) {
                              controller.handleBarcodeSubmit(context);
                              controller.barcodeController.clear();
                            },
                          ),
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                     const ImageBarcodeApp(),
                                ),
                              );
                            },
                            child: Container(
                              width: width * 0.9,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                color: Appcolors.secondarycolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:  Center(
                                child: Text(
                                  'Management',
                                  style: TextStyle(
                                    color: Appcolors.whicolor,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Invisible button
          Positioned(
            top: 30,
            left: 0,
            right: -350,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  _isScreenIgnored = true; // Disable interactivity
                });
              },
              onTap: _showPasswordDialog,
              child: Container(
                height: 50,
                color: Colors.transparent,
                child:  Icon(
                  color:Appcolors.whicolor,
                    Icons.settings_accessibility), // Invisible button
              ),
            ),
          ),
        ],
      ),
    );
  }
}
