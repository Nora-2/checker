import 'dart:io';
import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:checker/core/utilis/appimage/app_images.dart';
import 'package:flutter/material.dart';
import 'package:checker/core/widgets/output.dart';
import 'package:checker/core/widgets/topStack.dart';

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
    // Delay Navigator.pop() to simulate automatic navigation after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pop(context); // Safely pop the screen if the widget is still mounted
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Appcolors.secondarycolor,
      body: Column(
        children: [
          Container(
            color: Appcolors.secondarycolor,
            child: SizedBox(
              width: width,
              height: height * 0.23,
              child: const TopStack(
                text1: 'Scan View ',
                text2: 'Details of Scanned Items',
              ),
            ),
          ),
          Expanded( // Use Expanded to take up the remaining space
            child: Container(
              width: width,
              decoration:  BoxDecoration(
                color: Appcolors.whicolor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView( // Only one scroll view is needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.03),
                      Center(
                        child: SizedBox(
                          height: height * 0.2,
                          width: width*.2,
                          child: widget.product['item_photo'] != null
                              ? Image.file(
                                  File(widget.product['item_photo']),
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  Appimage.product, // Your placeholder image
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Output(label: '  Barcode : ', value: widget.product['barcode']),
                            SizedBox(height: height * 0.03),
                            Output(label: '  Brand : ', value: widget.product['brand']),
                            SizedBox(height: height * 0.03),
                            Output(label: '  Category : ', value: widget.product['category']),
                            SizedBox(height: height * 0.03),
                            Output(label: '  Item : ', value: widget.product['item']),
                            SizedBox(height: height * 0.03),
                            Output(label: '  Description : ', value: widget.product['description']),
                            SizedBox(height: height * 0.03),
                            Output(label: '  Unit : ', value: widget.product['unit']),
                            SizedBox(height: height * 0.03),
                            Output(label: '  Unit Price : ', value: widget.product['unit_price']),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}