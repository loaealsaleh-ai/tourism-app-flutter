import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/booking_bottom.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/reviews_section.dart';
import 'package:tourismapp/Features/Hotels/presentation/widgets/room_details_description.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import '../../../../app/router/app_router.dart';
import '../widgets/agent_section.dart';
import '../widgets/location_section.dart';
import '../widgets/room_details_section.dart';
import '../widgets/room_image_slider.dart';
import '../widgets/room_info_section.dart';
import '../widgets/room_thumbnail_list.dart';

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen({super.key});

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  final List<String> images = [hotelImage, hotelImage, hotelImage, hotelImage];
  int selectedImage = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
            context.go(AppRouter.routHotelsScreen);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RoomImageSlider(
                  images: images,
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
                  images: images,
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
                RoomInfoSection(),
                const SizedBox(height: 12),
          
                const Divider(),
                RoomDetailsSection(
                  bedrooms: "3",
                  bathrooms: "2",
                  balcony: "City View",
                  accessibility: "Accessible",
                  wifi: "Included",
                  restaurant: "On-site",
                  parking: "Indoor",
                ),
                const Divider(),
                const SizedBox(height: 12),
          
                RoomDetailsDescription(),
                const SizedBox(height: 12),
                const Divider(),
          
                const SizedBox(height: 12),
                AgentSection(),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                LocationSection(),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                ReviewsSection(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:BookingBottom(onTap: (){
        GoRouter.of(context).go(AppRouter.routBookingScreen);

      },),
    );
  }
}
