// ignore_for_file: use_build_context_synchronously

import 'package:checker/core/utilis/database/databasehelper.dart';
import 'package:checker/features/viewData/viewscreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final barcodeController = TextEditingController();


  // Handle Barcode Search
  void handleBarcodeSubmit(BuildContext context) async {
    final barcode = barcodeController.text;
    if (barcode.isNotEmpty) {
      final dbHelper = DatabaseHelper.instance;
      final product = await dbHelper.getProductByBarcode(barcode);

      if (product != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Viewpage(product: product)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('productNotFound'.tr)),
        );
      }
      
    }
  }
}
