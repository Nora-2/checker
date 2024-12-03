// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/excel.dart';
import 'package:path_provider/path_provider.dart';

import 'package:share_plus/share_plus.dart';


  dynamic filePath;

  Future<void> downloadData(BuildContext context) async {
  
      var directory = await getExternalStorageDirectory();
      filePath = '${directory!.path}/exceltemplet.xlsx';
      var excel = Excel.createExcel(); // Create an Excel file
      Sheet sheet = excel['Sheet1'];

      // Write headers
      List<String> headers = ['Barcode-باركود', 'Brandالعلامة التجارية  ', 'Catogary-المجموعه', 'Item-اسم الصنف','Description-الوصف','unit-الوحدة','Unit Price-سعر الوحدة'];
      sheet.appendRow(headers);
      if (kDebugMode) {
        print("Headers written");
      }
      var file = File(filePath);
      
      await file.writeAsBytes(excel.encode()!);
      if (kDebugMode) {
        print("File writing completed");
      }
      await shareExcelFile(filePath, context);

    } 
  
  Future<void> shareExcelFile(String filePath, BuildContext context) async {
    try {
      await Share.shareXFiles([XFile(filePath)], text: 'Here is your Excel file!');
    } catch (e) {
      if (kDebugMode) {
        print("Error sharing file: $e");
      }
      
    }
  }
