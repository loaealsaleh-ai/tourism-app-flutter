import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Hotels/data/repositories/room_repository.dart';
import 'package:tourismapp/Features/Hotels/data/services/room_service.dart';
import 'package:tourismapp/Features/Hotels/presentation/view_models/roomCubit/rooms_cubit.dart';
import 'package:tourismapp/core/network/api_client.dart';
import 'package:tourismapp/core/widgets/search_widget.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/storage/token_storage_service.dart';
import '../../../../core/widgets/card_shimmer.dart';
import '../view_models/roomCubit/rooms_state.dart';
import '../widgets/room_item_card.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key, required this.idHotel, required this.nameHotel});
  final int idHotel;
  final String nameHotel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RoomsCubit(RoomRepository(RoomService( ApiService(Dio(), TokenStorageService(),))))
            ..getRooms(idHotel),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            nameHotel,
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
              context.pop();
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

             BlocBuilder<RoomsCubit,RoomsState>(
                 builder:(context,state){
                   if(state is RoomsLoading){
                       return SliverToBoxAdapter(
                         child: ListView.builder(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemCount: 10,
                           itemBuilder: (_, __) => const CardShimmer(),
                         ),
                       );

                   }
                   if(state is RoomsSuccess){
                     return  SliverList(
                       delegate: SliverChildBuilderDelegate((context, index) {
                         final room=state.rooms[index];
                         return  Padding(
                           padding: EdgeInsets.only(bottom: 22),
                           child: RoomItemCard(room:room),
                         );
                       }, childCount: state.rooms.length),
                     );
                   }
                   if (state is RoomsError) {
                     return SliverToBoxAdapter(
                       child: Center(
                         child: Text(state.message),
                       ),
                     );
                   }
                   return const SliverToBoxAdapter(
                     child: SizedBox(),
                   );

              }
              )
            ],
          ),
        ),
      ),
    );
  }
}
