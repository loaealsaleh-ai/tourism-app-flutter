import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/app/router/app_router.dart';

import '../../data/models/services_model.dart';
import '../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
   ServicesScreen({super.key});

  final List<ServiceModel> services = [
    ServiceModel(
      icon: Icons.directions_car,
      title: "Car Rental",
      description: "Description",
    ),
    ServiceModel(
      icon: Icons.sim_card,
      title: "eSIM",
      description: "Description",
    ),
    ServiceModel(
      icon: Icons.translate,
      title: "Translation",
      description: "Description",
    ),
    ServiceModel(
      icon: Icons.currency_exchange,
      title: "Exchange",
      description: "Description",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final service = services[index];

            return ServiceCard(
              icon: service.icon,
              title: service.title,
              description: service.description,
                onTap: () {
                  switch (index) {
                   /* case 0:
                      context.push(AppRouter.routCarRentalScreen);
                      break;
                    case 1:
                      context.push(AppRouter.routEsimScreen);
                      break;*/
                    case 2:
                      context.push(AppRouter.routTranslationScreen);
                      break;
                   /* case 3:
                      context.push(AppRouter.routExchangeScreen);
                      break;*/
                  }
                }
            );
          },
        ),
      ),
    );
  }
}
