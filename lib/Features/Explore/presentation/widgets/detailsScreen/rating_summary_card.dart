import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';

class RatingSummaryCard extends StatelessWidget {
  const RatingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: const Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  "4.8",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor
                  ),
                ),

                SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star_half, color: Colors.amber),
                  ],
                ),

                SizedBox(height: 8),

                Text("24 Reviews"),
              ],
            ),
          ),

          SizedBox(width: 20),

          Expanded(
            flex: 3,
            child: Column(
              children: [
                RatingBarRow(
                  star: 5,
                  count: 18,
                  value: .9,
                ),

                SizedBox(height: 8),

                RatingBarRow(
                  star: 4,
                  count: 4,
                  value: .2,
                ),

                SizedBox(height: 8),

                RatingBarRow(
                  star: 3,
                  count: 1,
                  value: .05,
                ),

                SizedBox(height: 8),

                RatingBarRow(
                  star: 2,
                  count: 0,
                  value: 0,
                ),

                SizedBox(height: 8),

                RatingBarRow(
                  star: 1,
                  count: 1,
                  value: .05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RatingBarRow extends StatelessWidget {
  final int star;
  final int count;
  final double value;

  const RatingBarRow({
    super.key,
    required this.star,
    required this.count,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SizedBox(
          width: 15,
          child: Text("$star"),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: LinearProgressIndicator(
            color: kPrimaryColor,
            value: value,
            minHeight: 8,
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        const SizedBox(width: 8),

        Text("$count"),
      ],
    );
  }
}