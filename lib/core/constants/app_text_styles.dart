import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_constants.dart';

class AppTextStyles {
  static final title=TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: kPrimaryColor,
  );
  static final subtitle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
  static const body = TextStyle(
    fontSize: 14,
    color: Colors.black54,
    height: 1.5,
  );
  static const price = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w500,
    color: kPrimaryColor,
  );
  static final label= TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: kPrimaryColor
  );


}