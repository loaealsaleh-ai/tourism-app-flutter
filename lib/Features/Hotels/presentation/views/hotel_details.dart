import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/Hotels/data/repositories/hotel_repository.dart';
import 'package:tourismapp/Features/Hotels/presentation/view_models/hotelCubit/hotel_details_cubit.dart';
import 'package:tourismapp/Features/Hotels/presentation/view_models/hotelCubit/hotel_details_state.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/hotel_info.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/widgets/hotel_details_shimmer.dart';
import '../../data/services/hotel_service.dart';
import '../widgets/button_rooms.dart';
import '../widgets/hotel_image_slider.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HotelDetailsCubit(HotelRepository(HotelService(ApiService(Dio()))))
            ..getHotelById(id),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: BlocBuilder<HotelDetailsCubit, HotelDetailsState>(
          builder: (context, state) {
            if (state is HotelDetailsLoading) {
              return HotelDetailsShimmer();
            }
            if (state is HotelDetailsSuccess) {
              final hotel = state.hotel;
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              HotelImageSlider(hotel: hotel),
                              Transform.translate(
                                offset: const Offset(0, -40),
                                child: HotelInfo(hotel: hotel),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is HotelDetailsError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
        bottomNavigationBar: BlocBuilder<HotelDetailsCubit, HotelDetailsState>(
          builder: (context, state) {
            if (state is HotelDetailsSuccess) {
              return ButtonRooms(
                idHotel: id,
                nameHotel: state.hotel.name,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
