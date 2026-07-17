import 'package:flutter/material.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../view_models/translation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({super.key, required this.controller, required this.sourceLanguage, required this.targetLanguage});
  final TextEditingController controller;
  final String sourceLanguage;
  final String targetLanguage;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 50,

      child: ElevatedButton(
        onPressed: () async {
          context.read<TranslationCubit>().translate(
            text: controller.text,
            from: sourceLanguage,
            to: targetLanguage,
          );

        },

        style: ElevatedButton.styleFrom(
          backgroundColor:
          kPrimaryColor,

          shape:
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(14),
          ),
        ),

        child: const Text(
          "Translate",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}