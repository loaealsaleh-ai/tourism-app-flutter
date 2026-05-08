import 'package:flutter/cupertino.dart';

import '../servicesCard.dart';

class ServicesListView extends StatelessWidget {
  ServicesListView({super.key});
  final List<Map<String, String>> listServices = [
    {
      'image': 'assets/images/servicesImage/car.png',
      'title': 'Car Rental',
      'subtitle': 'Comfort rides anywhere',
    },
    {
      'image': 'assets/images/servicesImage/cart.png',
      'title': 'SIM Card',
      'subtitle': 'Stay connected easily',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: SizedBox(
        height: 205,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listServices.length,
          itemBuilder: (context, index) {
            final service = listServices[index];

            return ServiceCard(
              image: service['image']!,
              title: service['title']!,
              subtitle: service['subtitle']!,
            );
          },
        ),
      ),
    );
  }
}
