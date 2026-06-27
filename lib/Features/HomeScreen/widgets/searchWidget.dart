import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Color(0xFF0F4D4A)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Search destinations...',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Icon(Icons.tune, color: Color(0xFF0F4D4A)),
        ],
      ),
    );
  }
}
