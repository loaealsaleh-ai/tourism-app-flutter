import 'package:flutter/material.dart';
import 'package:tourismapp/const.dart';

class roomItemCard extends StatelessWidget {
  const roomItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
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
                child: Image.asset(
                  'assets/rest.png',
                  height: 155,
                  width: double.infinity,
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
                    color: KPrimarColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '\$120/night',
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
                    color: Colors.white.withOpacity(.95),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: KPrimarColor,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Deluxe Room',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: KPrimarColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.star, color: Colors.amber, size: 23),
                SizedBox(width: 4),
                Text(
                  '4.8',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: KPrimarColor, size: 18),
                SizedBox(width: 4),
                Text(
                  'Damascus, Syria',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(13, 0, 12, 14),
            child: Row(
              children: [
                _RoomInfoItem(
                  icon: Icons.groups_outlined,
                  text: '3 guests',
                ),
                const SizedBox(width: 18),
                _RoomInfoItem(
                  icon: Icons.bed_outlined,
                  text: '2 beds',
                ),
                const Spacer(),
                Container(
                  height: 36,
                  width: 36,
                  decoration: const BoxDecoration(
                    color: KPrimarColor,
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
        Icon(icon, color: KPrimarColor, size: 20),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: KPrimarColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}