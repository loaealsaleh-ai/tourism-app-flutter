import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_constants.dart';

class ButtonRooms extends StatelessWidget {
  const ButtonRooms({super.key, required this.idHotel, required this.nameHotel});
  final int idHotel;
  final String nameHotel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      child: SizedBox(
        height: size.height * 0.07,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: (){
            context.push(
              AppRouter.routRoomsScreen,
              extra: {
                'hotelId': idHotel,
                'hotelName': nameHotel,
              },
            );
          },
          child: Text(
            "See Rooms",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
