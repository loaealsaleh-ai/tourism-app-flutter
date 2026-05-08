import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/appBarWidget.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/firstImageWidget.dart';
import 'package:tourismapp/Features/HomeScreen/widgets/searchWidget.dart';


class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  final List<String> images = const [
    'assets/images/HomeImage/image_1.png',
    'assets/images/HomeImage/aleppo.png',
    'assets/images/HomeImage/Busra.png',
    'assets/images/HomeImage/Dama.png',
    'assets/images/HomeImage/Hama.png',
    'assets/images/HomeImage/Sea.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 40),
                        ),
                      );
                    },
                  ),

                  if (index == 0)
                    FirstImageWidget(),
                ],
              );
            },
            options: CarouselOptions(
              height: 285,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
            ),
          ),

          Positioned(
            top: 45,
            left: 24,
            right: 24,
            child:AppBarWidget(),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom:0,
            child: SearchWidget()
          ),
        ],
      ),
    );
  }
}
