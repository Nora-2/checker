import 'dart:io';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appicons/app_icons.dart';
import 'package:checker/features/management/datacontroller/addcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checker/core/utilis/sizedbox/sizedbox.dart';
import 'package:checker/core/widgets/Textformfield.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProductController controller = Get.put(AddProductController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.secondarycolor,
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormField(
                  hint: 'Barcode',
                  preicon:  Icon(Appicons.barcode),
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
                sized.s10,
                CustomFormField(
                  hint: 'Brand',
                  preicon:  Icon(Appicons.brand),
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
                sized.s10,
                CustomFormField(
                  hint: 'Category',
                  preicon:  Icon(Appicons.category),
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
                sized.s10,
                CustomFormField(
                  hint: 'Item',
                  preicon:  Icon(Appicons.input),
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
                sized.s10,
                CustomFormField(
                  hint: 'Description',
                  preicon:  Icon(Appicons.description),
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
                sized.s10,
                CustomFormField(
                  hint: 'Unit',
                  preicon:  Icon(Appicons.unit),
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
                sized.s10,
                CustomFormField(
                  hint: 'Unit Price',
                  preicon:  Icon(Appicons.unitprice),
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
                sized.s10,
                SizedBox(
                  height: 100,
                  width: 200,
                  child: GetBuilder<AddProductController>(
                    builder: (controller) {
                      return controller.imagePath != null
                          ? Image.file(File(controller.imagePath!))
                          : const Text('No image selected',textAlign: TextAlign.center,);
                    },
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Appcolors.secondarycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      width: 100,
                      height: 50,
                      child: IconButton(
                         color: Appcolors.whicolor,
                        onPressed: controller.pickImage,
                        icon:  Icon(Appicons.photo)
                      ),
                    ),
                    sized.w10,
                    Container(
                      width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Appcolors.secondarycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      child: IconButton(
                        color: Appcolors.whicolor,
                        onPressed: controller.saveProduct,
                        icon:  Icon(Appicons.save),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
