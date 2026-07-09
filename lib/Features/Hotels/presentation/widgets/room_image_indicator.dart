import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class RoomImageIndicator extends StatelessWidget {
  final int imagesLength;
  final int selectedImage;

  const RoomImageIndicator({
    super.key,
    required this.imagesLength,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imagesLength,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: selectedImage == index ? 12 : 8,
          height: selectedImage == index ? 12 : 8,
          decoration: BoxDecoration(
            color: selectedImage == index
                ? kPrimaryColor
                : kBackgroundColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}