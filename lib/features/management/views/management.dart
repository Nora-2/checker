
import 'dart:io';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/localization/localcontroller.dart';
import 'package:checker/core/utilis/sizedbox/sizedbox.dart';
import 'package:checker/core/widgets/CustomButton.dart';
import 'package:checker/core/widgets/topStack.dart';
import 'package:checker/features/home/presentation/home.dart';
import 'package:checker/features/management/datacontroller/imagecontroller.dart';
import 'package:checker/features/management/views/addproductscreen.dart';
import 'package:checker/features/management/views/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Management extends StatefulWidget {
  const Management({super.key});

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  @override
  Widget build(BuildContext context) {
    final Localcontroller localcontroller = Get.find();
    final ImageBarcodeController imageController =
        Get.put(ImageBarcodeController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Appcolors.whicolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopStack(
              text1: 'management'.tr,
              onBackPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sized.s80,
                 Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text('English'),
    Obx(() {
      return Switch(
        value: localcontroller.initialLang.value.languageCode == 'ar', // Check if language is Arabic
        onChanged: (value) {
          localcontroller.changeLanguage(value ? 'ar' : 'en'); // Toggle between languages
        },
      );
    }),
    const Text('العربية'),
  ],
),

                    Obx(() {
                      if (imageController.imagePath.value != null) {
                        return Center(
                          child: Image.file(
                            File(imageController.imagePath.value!),
                            width: width * .7,
                            height: height * 0.3,
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                      return Center(
                        child: InkWell(
                          onTap: () {
                            imageController.uploadImage();
                          },
                          child: Container(
                            width: width * .5,
                            height: height * 0.4,
                            decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                  BorderSide(
                                      color: Appcolors.imgBorder, width: 2),
                                ),
                                borderRadius: const BorderRadiusDirectional.all(
                                  Radius.circular(10),
                                ),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Imageupload-bro.png'))),
                          ),
                        ),
                      );
                    }),
                    sized.s40,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return imageController.isLoading.value
                              ? const CircularProgressIndicator()
                              : Custombutton(
                                  text: 'uploadExcel'.tr,
                                  onPressed: () => imageController
                                      .handleExcelUpload(context));
                        }),
                        Custombutton(
                          text: 'addManually'.tr,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddProductScreen(),
                            ),
                          ),
                        ),
                        Custombutton(
                            text: 'downloadExcel'.tr,
                            onPressed: () {
                              downloadData(context);
                            }),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
