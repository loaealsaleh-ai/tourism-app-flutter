import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class BookingTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  const BookingTextField({
    required this.icon,
    required this.hint,
     this.readOnly=false,
    this.onTap, this.controller, this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator:validation ,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        filled: true,
        fillColor: kBackgroundColor,
        prefixIcon: Icon(
          icon,
          color: kPrimaryColor,
        ),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1.5,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
        ),

      ),
    );
  }
}