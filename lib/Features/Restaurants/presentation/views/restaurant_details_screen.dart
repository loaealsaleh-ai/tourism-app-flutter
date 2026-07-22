import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/booking_bottom.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/reviews_section.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/restaurant_details_description.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/working_hours_section.dart';
import 'package:tourismapp/Features/Restaurants/presentation/widgets/food_types_section.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/Features/favorites/data/models/favorite_model.dart';
import 'package:tourismapp/Features/favorites/presentation/widgets/favorite_action_button.dart';
import 'package:tourismapp/Features/Restaurants/data/models/restaurant_nav_extra.dart';
import '../../../../app/router/app_router.dart';
import '../widgets/agent_section.dart';
import '../widgets/location_section.dart';
import '../widgets/restaurant_image_slider.dart';
import '../widgets/restaurant_thumbnail_list.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final RestaurantNavExtra? navExtra;

  const RestaurantDetailsScreen({
    super.key,
    this.navExtra,
  });

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late final List<String> images;

  int selectedImage = 0;

  final PageController pageController = PageController();

  static const FavoriteItemModel _defaultFavoriteItem =
  FavoriteItemModel(
    id: "royal_restaurant_default",
    type: FavoriteType.restaurant,
    title: "Royal Restaurant",
    location: "Damascus, Syria",
    price: "\$45/person",
    rating: 4.8,
    image: restaurantsImage,
  );

  static const String _defaultDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';


  @override
  void initState() {
    super.initState();

    final favImage = widget.navExtra?.favoriteItem.image;

    final image =
    (favImage == null || favImage.isEmpty)
        ? restaurantsImage
        : favImage;

    images = [
      image,
      image,
      image,
      image,
    ];
  }


  String _formatTime(String time24) {
    if (time24.isEmpty) return '';

    final parts = time24.split(':');

    if (parts.length < 2) return time24;

    int hour = int.tryParse(parts[0]) ?? 0;

    final minute = parts[1];

    final period = hour >= 12 ? 'PM' : 'AM';

    hour = hour % 12;

    if (hour == 0) {
      hour = 12;
    }

    return '$hour:$minute $period';
  }


  String _capitalize(String s) {
    if (s.isEmpty) return s;

    return s
        .split('_')
        .map(
          (w) =>
      w.isEmpty
          ? w
          : w[0].toUpperCase() + w.substring(1),
    )
        .join(' ');
  }


  @override
  Widget build(BuildContext context) {


    final favoriteItem =
        widget.navExtra?.favoriteItem ?? _defaultFavoriteItem;


    // التعديل هنا
    final description =
    favoriteItem.description.isNotEmpty
        ? favoriteItem.description
        : _defaultDescription;


    // التعديل هنا
    final hasHours =
        favoriteItem.openTime.isNotEmpty &&
            favoriteItem.closeTime.isNotEmpty;


    final hoursText =
    hasHours
        ? '${_formatTime(favoriteItem.openTime)} - ${_formatTime(favoriteItem.closeTime)}'
        : '10 AM - 12 PM';



    // التعديل هنا
    final hasType =
        favoriteItem.restaurantType.isNotEmpty;


    final foodTypes =
    hasType
        ? [
      FoodType(
        label: _capitalize(
          favoriteItem.restaurantType,
        ),
        icon: Icons.restaurant_menu_outlined,
      ),
    ]
        : const [
      FoodType(
        label: "Italian cuisine",
        icon: Icons.local_pizza_outlined,
      ),
      FoodType(
        label: "American cuisine",
        icon: Icons.lunch_dining_outlined,
      ),
    ];


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
          Padding(
            padding: const EdgeInsets.only(right: 8),

            child: FavoriteActionButton(
              item: favoriteItem,
              size: 40,
            ),
          ),
        ],


        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: kPrimaryColor,
            size: 30,
          ),

          onPressed: () {

            if (context.canPop()) {

              context.pop();

            } else {

              context.go(
                AppRouter.routRestaurantScreen,
              );

            }
          },
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),

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
                      duration:
                      const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );

                  },
                ),



                const SizedBox(height: 12),

                const Divider(),

                const SizedBox(height: 12),



                RestaurantDetailsDescription(
                  description: description,
                ),



                const SizedBox(height: 12),

                const Divider(),

                const SizedBox(height: 12),



                WorkingHoursSection(
                  hours: hoursText,
                ),



                const SizedBox(height: 12),

                const Divider(),

                const SizedBox(height: 12),



                FoodTypesSection(
                  foodTypes: foodTypes,
                ),



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

          GoRouter.of(context).go(
            AppRouter.routTableBookingScreen,
          );

        },

      ),
    );
  }
}