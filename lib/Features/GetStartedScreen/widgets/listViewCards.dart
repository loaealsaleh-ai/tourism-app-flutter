import 'package:flutter/cupertino.dart';
import 'package:tourismapp/Features/GetStartedScreen/Models/infoCardModel.dart';
import 'package:tourismapp/Features/GetStartedScreen/widgets/cardWidget.dart';

class ListViewCards extends StatelessWidget {
  const ListViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: exploreCards.length,
        itemBuilder: (context, index) {
          return CardWidget(infoCardModel: exploreCards[index],);
        });
  }
}
