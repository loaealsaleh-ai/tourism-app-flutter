import 'package:flutter/material.dart';
import 'package:tourismapp/const.dart';
import '../../../HomeScreen/widgets/searchWidget.dart';
import '../widgets/room_item_card.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: AppBar(
        backgroundColor: KBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: KPrimarColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Royal Hotel',
          style: TextStyle(
            color: KPrimarColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 8)),

          /*  const SliverToBoxAdapter(
              child: Text(
                'Find your best room in our Hotel',
                style: TextStyle(
                  color: KPrimarColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),*/
            const SliverToBoxAdapter(child: SearchWidget()),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 22),
                  child: roomItemCard(),
                );
              }, childCount: 8),
            ),
          ],
        ),
      ),
    );
  }
}
