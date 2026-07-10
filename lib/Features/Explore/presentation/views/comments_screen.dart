import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Explore/presentation/widgets/detailsScreen/commet_card.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/core/constants/app_text_styles.dart';

import '../widgets/detailsScreen/rating_summary_card.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,

                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                SizedBox(width: 80,),
                Text('Comments', style: AppTextStyles.title),
              ],
            ),
            SizedBox(height: 20,),
            RatingSummaryCard(),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 10,

                separatorBuilder: (_, __) => const SizedBox(height: 12),

                itemBuilder: (_, __) => const CommentCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
