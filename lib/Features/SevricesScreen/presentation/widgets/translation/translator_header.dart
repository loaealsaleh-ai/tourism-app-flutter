import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';

class TranslatorHeader extends StatelessWidget {
  const TranslatorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Translator",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Offline ready",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            "Translate text, voice.",
            style: TextStyle(
              color: Colors.white.withOpacity(.7),
            ),
          ),
        ],
      ),
    );
  }
}
