import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key, required this.sourceLanguage, required this.targetLanguage, required this.onSourceTap, required this.onTargetTap, required this.onSwap});
  final String sourceLanguage;
  final String targetLanguage;

  final VoidCallback onSourceTap;
  final VoidCallback onTargetTap;
  final VoidCallback onSwap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(15),
      ),

      child: Row(
        children: [

          Expanded(
            child: _LanguageItem(
              title: sourceLanguage,
              onTap: onSourceTap,
            ),
          ),

          const SizedBox(width: 12),

          InkWell(
            onTap: onSwap,
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              child: const Icon(
                Icons.swap_horiz,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: _LanguageItem(
              title: targetLanguage,
              onTap: onTargetTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _LanguageItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffEDF2F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(title),
      ),
    );
  }
}
