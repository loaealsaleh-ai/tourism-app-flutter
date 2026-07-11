import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Hotels/data/repositories/hotel_repository.dart';
import 'package:tourismapp/Features/Hotels/data/services/hotel_local_service.dart';
import 'package:tourismapp/Features/Hotels/presentation/view_models/hotel_details_view_model.dart';
import 'package:tourismapp/core/widgets/search_widget.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import '../../../../app/router/app_router.dart';
import '../widgets/room_item_card.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelDetailsViewModel(
        HotelRepository(HotelLocalService()),
      )..loadRooms(),
        child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Royal Hotel',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
              size: 25,
            ),
            onPressed: () {
              context.go(AppRouter.routMainScreen);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 8)),

              const SliverToBoxAdapter(child: SearchWidget()),

              const SliverToBoxAdapter(child: SizedBox(height: 20)),

              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 22),
                    child: RoomItemCard(),
                  );
                }, childCount: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
