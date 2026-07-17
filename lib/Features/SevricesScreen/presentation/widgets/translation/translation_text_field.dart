import 'package:flutter/material.dart';

class TranslationTextField extends StatelessWidget {
  const TranslationTextField({
    super.key, required this.controller,
  });
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,

      decoration: InputDecoration(
        hintText:
        "Enter the text you want to translate here",

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}