import 'dart:io';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appicons/app_icons.dart';
import 'package:checker/core/widgets/topStack.dart';
import 'package:checker/features/management/datacontroller/addcontroller.dart';
import 'package:checker/features/management/views/management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checker/core/utilis/sizedbox/sizedbox.dart';
import 'package:checker/core/widgets/Textformfield.dart';


class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProductController controller = Get.put(AddProductController());
    final height = MediaQuery.of(context).size.height;
     final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.whicolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            TopStack(
              text1: 'Add Product', 
              onBackPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Management(),
                          ),
                        ),
              child: Padding(
                padding:  EdgeInsets.only(top: height * 0.07 , left: width * 0.036 ,right: width * 0.036 ),
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomFormField(
                          hint: 'Barcode',
                          preicon: Icon(Appicons.barcode),
                          ispass: false,
                          controller: controller.barcodecontroller,
                          onSaved: (value) {
                            controller.productData['barcode'] = value!;
                          },
                          val: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a barcode';
                            }
                            return null;
                          },
                        ),
                        sized.s20,
                        CustomFormField(
                          hint: 'Brand',
                          preicon: Icon(Appicons.brand),
                          ispass: false,
                          controller: controller.brandcontroller,
                          onSaved: (value) {
                            controller.productData['brand'] = value!;
                          },
                          val: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a brand';
                            }
                            return null;
                          },
                        ),
                         sized.s20,
                        CustomFormField(
                          hint: 'Category',
                          preicon: Icon(Appicons.category),
                          ispass: false,
                          controller: controller.categorycontroller,
                          onSaved: (value) {
                            controller.productData['category'] = value!;
                          },
                          val: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a category';
                            }
                            return null;
                          },
                        ),
                        sized.s20,
                        CustomFormField(
                          hint: 'Item',
                          preicon: Icon(Appicons.input),
                          ispass: false,
                          controller: controller.itemcontroller,
                          onSaved: (value) {
                            controller.productData['item'] = value!;
                          },
                          val: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an item';
                            }
                            return null;
                          },
                        ),
                         sized.s20,
                        CustomFormField(
                          hint: 'Description',
                          preicon: Icon(Appicons.description),
                          ispass: false,
                          controller: controller.descrcontroller,
                          onSaved: (value) {
                            controller.productData['description'] = value!;
                          },
                          val: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        sized.s20,
                        CustomFormField(
                          hint: 'Unit',
                          preicon: Icon(Appicons.unit),
                          ispass: false,
                          controller: controller.unitcontroller,
                          onSaved: (value) {
                            controller.productData['unit'] = value!;
                          },
                          val: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a unit';
                            }
                            return null;
                          },
                        ),
                        sized.s20,
                        CustomFormField(
                          hint: 'Unit Price',
                          preicon: Icon(Appicons.unitprice),
                          ispass: false,
                          controller: controller.unitpricecontroller,
                          onSaved: (value) {
                            controller.productData['unit_price'] = value!;
                          },
                          val: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a unit price';
                            }
                            return null;
                          },
                        ),
                        sized.s40,
                        SizedBox(
                          height: height * 0.10,
                          width: width * 0.15,
                          child: GetBuilder<AddProductController>(builder: (controller) {
                            return controller.imagePath != null
                                ? Image.file(File(controller.imagePath!))
                                : const Text('No image selected', textAlign: TextAlign.center);
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Appcolors.secondarycolor,
                               gradient: AppGradients.primaryGradient,

                              ),
                              width: height * 0.15,
                              height: width * 0.097,
                              child: IconButton(
                                  color: Appcolors.whicolor,
                                  onPressed: controller.pickImage,
                                  icon: Icon(Appicons.photo , size: 70,)),
                            ),
                            sized.w(width * 0.19),
                            Container(
                              width: height * 0.15,
                              height: width * 0.097,
                              decoration: BoxDecoration(
                                color: Appcolors.secondarycolor,
                                gradient: AppGradients.primaryGradient,

                              ),
                              child: IconButton(
                                color: Appcolors.whicolor,
                                onPressed: controller.saveProduct,
                                icon: Icon(Appicons.save , size: 70,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
