import 'package:flutter/material.dart';
import 'package:tourismapp/app/router/app_router.dart';
// تأكد من استيراد الكلاس الصحيح الذي عدلناه
import 'package:tourismapp/Features/Restaurants/presentation/widgets/restaurant_item_card.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key, required this.isSeeAll});
  final bool isSeeAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSeeAll ? null : 270,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        physics: const BouncingScrollPhysics(),
        scrollDirection: isSeeAll ? Axis.vertical : Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: isSeeAll ? 16 : 0),
            child: RestaurantItemCard( // استخدمنا الكلاس الصحيح
              route: AppRouter.routRestaurantScreen, // الآن سيعمل الانتقال للقائمة
            ),
          );
        },
      ),
    );
  }
}