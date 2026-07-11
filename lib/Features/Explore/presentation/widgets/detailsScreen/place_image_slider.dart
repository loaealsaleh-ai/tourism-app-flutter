import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/app/router/app_router.dart';

import '../../../../../core/constants/app_constants.dart';

class PlaceImageSlider extends StatefulWidget {
  const PlaceImageSlider({super.key});

  @override
  State<PlaceImageSlider> createState() => _PlaceImageSliderState();
}

class _PlaceImageSliderState extends State<PlaceImageSlider> {
  final PageController controller = PageController();

  int currentIndex = 0;

  final images = [tripImage, tripImage, tripImage];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.38,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(images[index], fit: BoxFit.cover);
            },
          ),

          Positioned(
            top: 60,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,

              child: IconButton(
                onPressed: () {
                  context.pop();
                },

                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,

              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ),
          ),

          Positioned(
            bottom: 45,
            left: 0,
            right: 0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(
                images.length,

                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),

                  width: currentIndex == index ? 12 : 8,

                  height: currentIndex == index ? 12 : 8,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? kPrimaryColor : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
