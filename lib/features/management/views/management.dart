import 'dart:io';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/sizedbox/sizedbox.dart';
import 'package:checker/core/widgets/CustomButton.dart';
import 'package:checker/core/widgets/topStack.dart';
import 'package:checker/features/home/presentation/home.dart';
import 'package:checker/features/management/datacontroller/imagecontroller.dart';
import 'package:checker/features/management/views/addproductscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Management extends StatelessWidget {
  const Management({super.key});

  @override
  Widget build(BuildContext context) {
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
              text1: 'Management',
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
                                  BorderSide(color: Appcolors.imgBorder, width: 2),
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
                                  text: 'Upload Excel',
                                  onPressed: () => imageController
                                      .handleExcelUpload(context));
                        }),
                        Custombutton(
                          text: 'Add Manually',
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddProductScreen(),
                            ),
                          ),
                        ),
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
