import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/booking_bottom.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/reviews_section.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/restaurant_details_description.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/working_hours_section.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/food_types_section.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import '../../../../app/router/app_router.dart';
import '../widgets/agent_section.dart';
import '../widgets/location_section.dart';
import '../widgets/restaurant_image_slider.dart';
import '../widgets/restaurant_thumbnail_list.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  final List<String> images = [onboardingImageOne, onboardingImageOne, onboardingImageOne, onboardingImageOne];
  int selectedImage = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
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
            context.go(AppRouter.routRestaurantScreen);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RestaurantImageSlider(
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
                RestaurantThumbnailList(
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
                const SizedBox(height: 12),

                const RestaurantDetailsDescription(),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),

                const WorkingHoursSection(),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),

                const FoodTypesSection(),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),

                const AgentSection(),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),

                const LocationSection(),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),

                const ReviewsSection(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BookingBottom(
        onTap: () {
          GoRouter.of(context).go(AppRouter.routTableBookingScreen);
        },
      ),
    );
  }
}