import 'package:flutter/material.dart';
import 'package:tourismapp/Features/Explore/presentation/widgets/place_card.dart';

import '../../../../core/widgets/search_widget.dart';
import '../widgets/category_filter.dart';
import '../widgets/explore_header.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: CustomScrollView(
        physics:BouncingScrollPhysics() ,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),

          SliverToBoxAdapter(
            child: ExploreHeader(),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),

          SliverToBoxAdapter(
            child: SearchWidget(),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),

          SliverToBoxAdapter(
            child: CategoryFilter(),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return const PlaceCard();
              },
              childCount: 6,
            ),

            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
          ),
        ],
      ),
    );
  }
}
