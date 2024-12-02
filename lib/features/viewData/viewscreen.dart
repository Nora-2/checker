// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appimage/app_images.dart';
import 'package:checker/core/widgets/output.dart';
import 'package:checker/core/widgets/topStack.dart';
import 'package:checker/features/home/presentation/home.dart';
import 'package:flutter/material.dart';

class Viewpage extends StatefulWidget {
  final Map<String, dynamic> product;
  const Viewpage({super.key, required this.product});

  @override
  _ViewpageState createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Appcolors.whicolor,
      body: TopStack(
        text1: 'Scan View',
        text2: 'Details of Scanned Items',
        onBackPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.07, left: width * 0.036, right: width * 0.036),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Output(
                        label: '  Barcode : ',
                        value: widget.product['barcode'],
                      ),
                      const SizedBox(height: 16),
                      Output(
                        label: '  Brand : ',
                        value: widget.product['brand'],
                      ),
                      const SizedBox(height: 16),
                      Output(
                        label: '  Category : ',
                        value: widget.product['category'],
                      ),
                      const SizedBox(height: 16),
                      Output(
                        label: '  Item : ',
                        value: widget.product['item'],
                      ),
                      const SizedBox(height: 16),
                      Output(
                        label: '  Description : ',
                        value: widget.product['description'],
                      ),
                      const SizedBox(height: 16),
                      Output(
                        label: '  Unit : ',
                        value: widget.product['unit'],
                      ),
                      const SizedBox(height: 16),
                      Output(
                        label: '  Unit Price : ',
                        value: widget.product['unit_price'],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.5,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: widget.product['item_photo'] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(widget.product['item_photo']),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Appimage.product,
                            fit: BoxFit.cover,
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
