import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checker/core/utilis/database/databasehelper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProductController extends GetxController {
  final categorycontroller = TextEditingController();
  final brandcontroller = TextEditingController();
  final barcodecontroller = TextEditingController();
  final itemcontroller = TextEditingController();
  final descrcontroller = TextEditingController();
  final unitcontroller = TextEditingController();
  final unitpricecontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> productData = {
    'barcode': '',
    'brand': '',
    'category': '',
    'item': '',
    'description': '',
    'unit': '',
    'unit_price': '',
    'item_photo': '',
  };

  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _imagePath;

  String? get imagePath => _imagePath;

  @override
  void onInit() {
    super.onInit();
    _requestPermissions();
  }

  void _showMessage(String message) {
    Get.snackbar("Message", message);
  }

  Future<void> _requestPermissions() async {
    PermissionStatus storagePermission = await Permission.storage.request();
    if (!storagePermission.isGranted) {
      Get.snackbar(
        "Permission Denied",
        "Storage permission is required.",
        snackPosition: SnackPosition.BOTTOM,
        mainButton: TextButton(
          onPressed: () => openAppSettings(),
          child: const Text('Open Settings'),
        ),
      );
    }
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      Directory appDir = await getApplicationDocumentsDirectory();
      String uniqueName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      String savedPath = p.join(appDir.path, uniqueName);
      File savedImage = await File(image.path).copy(savedPath);

      _image = savedImage;
      _imagePath = savedPath;
      productData['item_photo'] = savedPath;
      update();
    } catch (e) {
      _showMessage("Error: $e");
    }
  }

  void saveProduct() async {
    if (_image == null) {
      _showMessage("Please select an image.");
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await DatabaseHelper.instance.insertOrUpdateProduct(productData);

      _showMessage('Product added successfully!');
      clearFields();
      Get.back();
    }
  }

  void clearFields() {
    categorycontroller.clear();
    brandcontroller.clear();
    barcodecontroller.clear();
    itemcontroller.clear();
    descrcontroller.clear();
    unitcontroller.clear();
    unitpricecontroller.clear();
    _image = null;
    _imagePath = null;
    productData.clear();
    update();
  }
}
