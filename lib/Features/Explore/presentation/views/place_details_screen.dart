import 'package:flutter/material.dart';
import 'package:tourismapp/Features/Explore/presentation/widgets/detailsScreen/place_info.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../widgets/detailsScreen/place_image_slider.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const PlaceImageSlider(),
                      Transform.translate(
                        offset: const Offset(0, -40),
                        child: const PlaceInfo(),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}