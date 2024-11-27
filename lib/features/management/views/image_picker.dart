import 'dart:io';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/sizedbox/sizedbox.dart';
import 'package:checker/features/management/datacontroller/imagecontroller.dart';
import 'package:checker/features/management/views/adddatascreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageBarcodeApp extends StatelessWidget {
  const ImageBarcodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageBarcodeController imageController =
        Get.put(ImageBarcodeController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.secondarycolor,
        title: const Text("Mangement"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    width: width * .7,
                    height: height * 0.3,
                    decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(color: Colors.grey, width: 2),
                        ),
                        borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
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
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Appcolors.secondarycolor),
                          ),
                          onPressed: () =>
                              imageController.handleExcelUpload(context),
                          child: const Text("Upload Excel"),
                        );
                }),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Appcolors.secondarycolor),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductScreen(),
                    ),
                  ),
                  child: const Text("Add Manually"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
