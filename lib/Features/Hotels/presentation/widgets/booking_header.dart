import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/app_constants.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       /* Text(
          "Booking",
          style: TextStyle(
            fontSize: width * 0.080,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),*/
        Lottie.asset(
          'assets/animations/booking.json',
        ),
        Text(
          "Make a Booking",
          style: TextStyle(
              fontSize: width * 0.055,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor
          ),
        ),
        Text(
          "Choose your booking date",
          style: TextStyle(
            color: Colors.grey,
            fontSize: width * 0.045,
          ),
        ),
      ],
    );
  }
}
