import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/booking_bottom.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/reviews_section.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/room_details_description.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/core/widgets/hotel_details_shimmer.dart';
import '../../../../app/router/app_router.dart';
import '../../../../core/network/api_client.dart';
import '../../data/repositories/room_repository.dart';
import '../../data/services/room_service.dart';
import '../view_models/roomCubit/room_details_cubit.dart';
import '../widgets/agent_section.dart';
import '../widgets/location_section.dart';
import '../widgets/room_details_section.dart';
import '../widgets/room_image_slider.dart';
import '../widgets/room_info_section.dart';
import '../widgets/room_thumbnail_list.dart';

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen({super.key, required this.idRoom});
  final int idRoom;

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  int selectedImage = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_)=>
      RoomDetailsCubit(RoomRepository(RoomService(ApiService(Dio()))))..getRoomById(widget.idRoom),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Details",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: kPrimaryColor,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: kPrimaryColor,
              size: 30,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: BlocBuilder<RoomDetailsCubit,RoomDetailsState>(
          builder: (context,state){
            if(state is RoomDetailsLoading){
              return HotelDetailsShimmer();
            }
            if(state is RoomDetailsSuccess){
              final room =state.roomModel;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        RoomImageSlider(
                          images: room.images,
                          selectedImage: selectedImage,
                          pageController: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              selectedImage = index;
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        RoomThumbnailList(
                          images: room.images,
                          selectedImage: selectedImage,
                          onImageTap: (index) {
                            setState(() {
                              selectedImage = index;
                            });
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                        const SizedBox(height: 12),

                        const Divider(),
                        RoomInfoSection(price: room.pricePerNight.toString(),type: room.roomType,),
                        const SizedBox(height: 12),

                        const Divider(),
                        RoomDetailsSection(
                          bedrooms: room.bedsCount.toString(),
                          bathrooms: room.bathroomsCount.toString(),
                          balcony: room.hasBalcony.toString() ,
                          floor: room.floor.toString(),
                        ),
                        const Divider(),
                        const SizedBox(height: 12),

                        RoomDetailsDescription(desc: room.description,),
                        const SizedBox(height: 12),
                        const Divider(),

                        const SizedBox(height: 12),
                        AgentSection(),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        ReviewsSection(),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              );
            }
            if(state is RoomDetailsError){
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },

        ),
        bottomNavigationBar:BookingBottom(onTap: (){
          GoRouter.of(context).go(AppRouter.routBookingScreen);

        },),
      ),
    );
  }
}
