import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class RestaurantThumbnailList extends StatelessWidget {
  final List<String> images;
  final int selectedImage;
  final Function(int) onImageTap;

  const RestaurantThumbnailList({
    super.key,
    required this.images,
    required this.selectedImage,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onImageTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedImage == index
                      ? kPrimaryColor
                      : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  images[index],
                  width: size.width * 0.22,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}