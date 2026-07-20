import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Hotels/data/models/room_model.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/widgets/image_shimmer.dart';

class RoomItemCard extends StatelessWidget {
  const RoomItemCard({super.key, required this.room});
  final RoomModel room;

  String shortDescription(String text) {
    final words = text.split(' ');

    if (words.length <= 2) {
      return text;
    }

    return '${words.take(2).join(' ')}...';
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        context.push(AppRouter.routRoomDetails,extra: room.id);
      },
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child:CachedNetworkImage(
                    imageUrl: room.images.first,
                    placeholder: (context, url) => ImageShimmer(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 9,
                    ),
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child:  Text(
                      '\$ ${room.pricePerNight}/night',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: kPrimaryColor,
                      size: 26,
                    ),
                  ),
                ),
              ],
            ),

             Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      shortDescription(room.description),
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.star, color: Colors.amber, size: 23),
                  SizedBox(width: 4),
                  Text(
                    room.rate.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '${room.roomType[0].toUpperCase() + room.roomType.substring(1)} Room',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(13, 0, 12, 14),
              child: Row(
                children: [
                  _RoomInfoItem(
                    icon: Icons.apartment,
                    text: '${room.floor} floor',
                  ),
                  const SizedBox(width: 18),
                  _RoomInfoItem(
                    icon: Icons.bed_outlined,
                    text: '${room.bedsCount} beds',
                  ),
                  const SizedBox(width: 18),
                  _RoomInfoItem(
                    icon: Icons.bathtub,
                    text: '${room.bathroomsCount} baths',
                  ),
                  const Spacer(),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoomInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _RoomInfoItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kPrimaryColor, size: 20),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
