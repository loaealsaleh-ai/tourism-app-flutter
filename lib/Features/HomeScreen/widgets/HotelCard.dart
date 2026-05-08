import 'package:flutter/material.dart';
import 'package:tourismapp/const.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    'assets/rest.png',
                    height: 155,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      size: 21,
                      color: KPrimarColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: const BoxDecoration(
                      color: KPrimarColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '\$120/night',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    maxLines: 1,
                    'Royal Hotel',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: KPrimarColor,
                    ),
                  ),
                  Row(
                    children: [
                       Icon(Icons.star,
                          color: Colors.amber, size: 20),
                       SizedBox(width: 5),
                       Text(
                        '4.8',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4,),
              child: Row(
                children: [
                  Icon(Icons.location_on,size: 20,color: KPrimarColor,),
                  Text(
                    'Damascus, Syria',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
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