import 'package:flutter/material.dart';
import 'room_image_indicator.dart';

class RoomImageSlider extends StatelessWidget {
  final List<String> images;
  final int selectedImage;
  final PageController pageController;
  final Function(int) onPageChanged;

  const RoomImageSlider({
    super.key,
    required this.images,
    required this.selectedImage,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: size.height * 0.3,
            width: double.infinity,
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),

        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: RoomImageIndicator(
            imagesLength: images.length,
            selectedImage: selectedImage,
          ),
        ),
      ],
    );
  }
}