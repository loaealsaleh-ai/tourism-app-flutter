import 'package:flutter/material.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/core/constants/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AgentSection extends StatelessWidget {
  const AgentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Agent", style: AppTextStyles.title),

        const SizedBox(height: 12),

        Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: kPrimaryColor,
              child: Icon(Icons.person, color: Colors.white),
            ),

            const SizedBox(width: 12),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor
                    ),
                  ),

                  SizedBox(height: 2),

                  Text(
                    "Role",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () async {
                await launchUrl(
                  Uri.parse('tel:0988892049'),
                );
              },
              icon: const Icon(
                Icons.phone_outlined,
                color: kPrimaryColor,
                size: 28,
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: kPrimaryColor,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}