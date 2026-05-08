import 'package:flutter/material.dart';

class TripPackageCard extends StatelessWidget {
  const TripPackageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: const DecorationImage(
            image: AssetImage('assets/images/HomeImage/Busra.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.85),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 14,
              right: 14,
              child: Icon(
                Icons.favorite_border,
                color:Colors.white,
                size: 25,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore Palmyra',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Icon(Icons.calendar_month,
                          color: Colors.white, size: 17),
                      SizedBox(width: 5),
                      Text(
                        '3 Days 2 Nights',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      SizedBox(width: 14),
                      Icon(Icons.location_on_outlined,
                          color: Colors.white, size: 17),
                      SizedBox(width: 5),
                      Text(
                        'Palmyra, Syria',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Divider(
                    color: Colors.white.withOpacity(0.25),
                    thickness: 1,
                    endIndent: 120,
                  ),

                  const SizedBox(height: 4),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.star,
                          color: Colors.amber, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '4.8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '(230 reviews)',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '\$120',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '/ person',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
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