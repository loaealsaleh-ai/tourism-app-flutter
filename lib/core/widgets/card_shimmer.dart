import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFD6DCE1),
        highlightColor: const Color(0xFFF5F7F8),
        child: Container(
          width: 250,
          decoration: BoxDecoration(
            color: const Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 155,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0D5DA),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE7EBEE),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1E5E8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE1E5E8),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Container(
                      width: 45,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE1E5E8),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1E5E8),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 100,
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE1E5E8),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}