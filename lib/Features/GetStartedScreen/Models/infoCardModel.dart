import 'package:flutter/material.dart';
import 'package:tourismapp/const.dart';

class InfoCardModel {
  final String title;
  final String subtitle;
  final String image;
  final IconData icon;

  const InfoCardModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.icon,
  });
}

const List<InfoCardModel> exploreCards = [
  InfoCardModel(
    title: 'Landmarks',
    subtitle: 'Explore iconic places\nfull of history',
    image: card1Image,
    icon: Icons.account_balance,
  ),
  InfoCardModel(
    title: 'Hotels',
    subtitle: 'Find the best hotels\nfor your stay',
    image: hotelImage,
    icon: Icons.hotel,
  ),
  InfoCardModel(
    title: 'Restaurants',
    subtitle: 'Discover top restaurants\nand local flavors',
    image: RestaurantsImage,
    icon: Icons.restaurant,
  ),
  InfoCardModel(
    title: 'Trips',
    subtitle: 'Plan your next adventure\nand unforgettable trips',
    image: tripImage,
    icon: Icons.map,
  ),
];
