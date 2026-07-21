import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class RoomDetailsDescription extends StatelessWidget {
  const RoomDetailsDescription({super.key,required this.desc});
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Align(
           alignment: Alignment.centerLeft,
           child: Text(
            'Description',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
                   ),
         ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            desc,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
