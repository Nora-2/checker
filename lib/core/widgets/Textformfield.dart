// ignore_for_file: must_be_immutable

import 'package:checker/core/utilis/appcolors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
   CustomFormField({
    required this.hint,
    required this.preicon,
    this.text,
    this.sign,
    this.massege,
    this.val,
    required this.ispass,
    this.suffix,
    required this.controller,
    this.onSaved,
    this.onChanged,
    this.onsubmit,
    this.autofocus = false, // Add this property

    super.key,
  });
  final bool ispass;
  final String hint;
  final Widget preicon;
  final TextInputType? text;
  final String? sign;
  final String? massege;
  final Widget? suffix;
  final void Function(String)? onsubmit;
  final TextEditingController? controller;
  final String? Function(String?)? val;
  final void Function(String?)? onChanged;
  void Function(String?)? onSaved;
  final bool autofocus; // New property to control focus

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late FocusNode _focusNode;

  @override
void initState() {
  super.initState();
  _focusNode = FocusNode();

  if (widget.autofocus) {
    Future.delayed(Duration.zero, () {
      _focusNode.requestFocus();
    });
  }
}


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
      
      autofocus: true, // This field will get focus initially
   
      onFieldSubmitted: (value) {
        if (widget.onsubmit != null) {
          widget.onsubmit!(value);
        }
        // Request focus again after submitting
        _focusNode.requestFocus();
      },
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      maxLines: 1,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIconColor: Appcolors.secondarycolor,
        
        hintStyle:  TextStyle(color: Appcolors.seccolor, fontSize: 16),
        prefixIcon: widget.preicon,
        suffixIcon: widget.suffix,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: Appcolors.secondarycolor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Appcolors.transcolor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Appcolors.transcolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: Appcolors.seccolor,
          ),
        ),
      ),
      obscureText: widget.ispass,
      obscuringCharacter: '*',
      keyboardType: widget.text,
      validator: widget.val,
    );
  }
}