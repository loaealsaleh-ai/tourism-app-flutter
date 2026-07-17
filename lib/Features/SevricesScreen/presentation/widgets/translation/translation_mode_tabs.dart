import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';

class TranslationTabs extends StatelessWidget {
  const TranslationTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [

        Expanded(
          child: TabItem(
            title: "Text",
            selected: true,
          ),
        ),

        SizedBox(width: 10),

        Expanded(
          child: TabItem(
            title: "Voice",
            selected: false,
          ),
        ),

        SizedBox(width: 10),

        Expanded(
          child: TabItem(
            title: "Camera",
            selected: false,
          ),
        ),
      ],
    );
  }
}


class TabItem extends StatelessWidget {
  final String title;
  final bool selected;

  const TabItem({
    super.key,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected
            ? kPrimaryColor
            : Colors.white,
        borderRadius:
        BorderRadius.circular(12),
      ),

      child: Text(
        title,
        style: TextStyle(
          color: selected
              ? Colors.white
              : kPrimaryColor,
        ),
      ),
    );
  }
}