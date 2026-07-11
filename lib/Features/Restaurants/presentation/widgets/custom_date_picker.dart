import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

Future<DateTimeRange?> showCustomDateRangePicker(BuildContext context) async {
  return await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor,
              onPrimary: Colors.white,
              onSurface: kPrimaryColor,
            ),
          ),
          child: child!,
        );
      }
  );
}