import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/card_shimmer.dart';
import '../../../../../core/widgets/cards/hotel_card.dart';
import '../../../../Hotels/presentation/view_models/hotelCubit/hotel_cubit.dart';
import '../../../../Hotels/presentation/view_models/hotelCubit/hotel_state.dart';

class HotelListView extends StatelessWidget {
  const HotelListView({
    super.key,
    required this.isSeeAll,
  });

  final bool isSeeAll;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {

        if (state is HotelLoading) {
          if (isSeeAll) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (_, __) => const CardShimmer(),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SizedBox(
              height: 267,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, __) => const CardShimmer(),
              ),
            ),
          );
         /* return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),

           /* SizedBox(
              height: isSeeAll? double.infinity:252,
              child: ListView.builder(
                scrollDirection:
                isSeeAll ? Axis.vertical : Axis.horizontal,
                itemCount:10,
                itemBuilder: (_, __) {
                  return const CardShimmer();
                },
              ),
            ),*/
          );*/
        }

        if (state is HotelSuccess) {

          final hotels = state.hotels;

          if(isSeeAll){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    final hotel = hotels[index];

                    return HotelCard(
                      hotelModel: hotel,
                    );
                  },
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SizedBox(
              height: 265,
              child: ListView.builder(
                itemCount: hotels.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {

                  final hotel = hotels[index];
                  return HotelCard(
                    hotelModel: hotel,
                  );
                },
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}