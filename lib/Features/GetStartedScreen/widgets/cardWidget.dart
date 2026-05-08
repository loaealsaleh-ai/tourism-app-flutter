import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/features/GetStartedScreen/Models/infoCardModel.dart';
import 'package:tourismapp/appRouter.dart';
import 'package:tourismapp/const.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.infoCardModel});
  final InfoCardModel infoCardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouter.login);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SizedBox(
          height: 250,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: AssetImage(infoCardModel.image),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(.75),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  bottom: 100,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: KPrimarColor,
                    child: Icon(
                      infoCardModel.icon,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  right: 12,
                  bottom: 18,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        infoCardModel.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        infoCardModel.subtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 14,
                  bottom: 24,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
