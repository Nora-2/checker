// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:checker/core/utilis/database/databasehelper.dart';
class ImageBarcodeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final imagePath = RxnString();
  var isLoading = false.obs;

  // Handle Excel Upload
  Future<void> handleExcelUpload(BuildContext context) async {
    try {
      isLoading(true); // Start loading
      // Open file picker for Excel files
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.single;

        if (file.path != null) {
          final bytes = await File(file.path!).readAsBytes();
          final excel = Excel.decodeBytes(bytes);

          final dbHelper = DatabaseHelper.instance;
          final List<Map<String, dynamic>> uploadedData = [];

          for (var table in excel.tables.keys) {
            for (var row in excel.tables[table]!.rows.skip(1)) {
              final barcode = row[0]?.value?.toString().trim();
              if (barcode != null && barcode.isNotEmpty) {
                final product = {
                  DatabaseHelper.columnBarcode: barcode,
                  DatabaseHelper.columnBrand: row[1]?.value?.toString().trim(),
                  DatabaseHelper.columnCategory:
                      row[2]?.value?.toString().trim(),
                  DatabaseHelper.columnItem: row[3]?.value?.toString().trim(),
                  DatabaseHelper.columnDescription:
                      row[4]?.value?.toString().trim(),
                  DatabaseHelper.columnUnit: row[5]?.value?.toString().trim(),
                  DatabaseHelper.columnUnitPrice: _parsePrice(row[6]?.value),
                  
                };

                await dbHelper.insertOrUpdateProduct(product);
                uploadedData.add(product);
              }
            }
          }

          // Print uploaded data
          print("Uploaded Data: $uploadedData");

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Excel uploaded successfully!")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to get file path.")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No file selected.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading Excel: $e")),
      );
    } finally {
      isLoading(false); // Stop loading
    }
  }

  String? _parsePrice(dynamic value) {
    if (value == null) return null;
    return value.toString().trim();
  }
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
          child: const Text("Open Settings"),
        ),
      );
    } else if (await Permission.manageExternalStorage.request().isGranted) {
      _showMessage("Manage External Storage permission granted.");
    }
  }

  Future<void> uploadImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      String imageName = p.basenameWithoutExtension(image.path);
      Directory appDir = await getApplicationDocumentsDirectory();
      String uniqueName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      String savedPath = p.join(appDir.path, uniqueName);
      File savedImage = await File(image.path).copy(savedPath);

      imagePath.value = savedPath;

      Map<String, dynamic>? product = await DatabaseHelper.instance.getProductByBarcode(imageName);

      if (product != null) {
        Map<String, dynamic> mutableProduct = Map.from(product);
        mutableProduct[DatabaseHelper.columnItemPhoto] = savedPath;
        await DatabaseHelper.instance.insertOrUpdateProduct(mutableProduct);
        _showMessage("Image associated with barcode: $imageName");
      } else {
        _showMessage("No product found with barcode: $imageName");
      }
    } catch (e) {
      _showMessage("Error: $e");
    }
  }

  Future<void> printAllProducts() async {
    try {
      List<Map<String, dynamic>> products = await DatabaseHelper.instance.fetchAllProducts();
      for (var product in products) {
        print("Product: $product");
      }
      _showMessage("Fetched ${products.length} products.");
    } catch (e) {
      _showMessage("Error fetching products: $e");
    }
  }
}
