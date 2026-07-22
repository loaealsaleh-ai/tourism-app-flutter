import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/Features/favorites/data/models/favorite_model.dart';
import 'package:tourismapp/Features/favorites/presentation/widgets/favorite_action_button.dart';
import 'package:tourismapp/Features/Restaurants/data/models/restaurant_nav_extra.dart';


class RestaurantItemCard extends StatelessWidget {

  final String route;
  final bool isListView;

  final String id;
  final String title;
  final String location;
  final String price;
  final double rating;
  final String image;

  final String type;
  final String description;
  final String openTime;
  final String closeTime;

  const RestaurantItemCard({

    super.key,

    required this.route,

    this.isListView = false,

    this.id = "royal_restaurant_default",

    this.title = "Royal Restaurant",

    this.location = "Damascus, Syria",

    this.price = "\$45/person",

    this.rating = 4.8,

    this.image = restaurantsImage,

    this.type = '',

    this.description = '',

    this.openTime = '',

    this.closeTime = '',

  });



  Widget buildRestaurantImage({

    required double height,

    required double width,

    required BorderRadius borderRadius,

  }) {


    if(image.startsWith('http')) {

      return ClipRRect(

        borderRadius: borderRadius,

        child: Image.network(

          image,

          height: height,

          width: width,

          fit: BoxFit.cover,


          errorBuilder:
              (context, error, stackTrace) {

            return Image.asset(

              restaurantsImage,

              height: height,

              width: width,

              fit: BoxFit.cover,

            );

          },

        ),

      );


    }


    return ClipRRect(

      borderRadius: borderRadius,

      child: Image.asset(

        image.isEmpty
            ? restaurantsImage
            : image,


        height: height,

        width: width,

        fit: BoxFit.cover,

      ),

    );

  }





  @override
  Widget build(BuildContext context) {


    final favoriteItem = FavoriteItemModel(

      id: id,

      type: FavoriteType.restaurant,

      title: title,

      location: location,

      price: price,

      rating: rating,

      image: image,

      description: description,

      openTime: openTime,

      closeTime: closeTime,

      restaurantType: type,

    );

    final navExtra = RestaurantNavExtra(
      favoriteItem: favoriteItem,
      description: description,
      openTime: openTime,
      closeTime: closeTime,
      type: type,
    );
    // ================= LIST VIEW =================


    if(isListView) {


      return InkWell(

        onTap: () =>
            context.push(
              route,
              extra: navExtra,
            ),


        borderRadius:
        BorderRadius.circular(22),


        child: Container(


          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius:
            BorderRadius.circular(22),


            boxShadow: [

              BoxShadow(

                color:
                Colors.black.withValues(alpha: 0.08),

                blurRadius: 10,

                offset:
                const Offset(0,4),

              ),

            ],

          ),



          child: Column(


            crossAxisAlignment:
            CrossAxisAlignment.start,


            children: [



              Stack(

                children: [


                  buildRestaurantImage(

                    height: 155,

                    width: double.infinity,


                    borderRadius:
                    const BorderRadius.only(

                      topLeft:
                      Radius.circular(22),

                      topRight:
                      Radius.circular(22),

                      bottomLeft:
                      Radius.circular(12),

                      bottomRight:
                      Radius.circular(12),

                    ),

                  ),




                  Positioned(

                    top: 0,

                    left: 0,


                    child: Container(


                      padding:
                      const EdgeInsets.symmetric(

                        horizontal: 18,

                        vertical: 9,

                      ),


                      decoration:
                      const BoxDecoration(


                        color: kPrimaryColor,


                        borderRadius:
                        BorderRadius.only(

                          topLeft:
                          Radius.circular(22),

                          bottomRight:
                          Radius.circular(12),

                        ),

                      ),



                      child: Text(

                        price,


                        style:
                        const TextStyle(

                          color: Colors.white,

                          fontSize: 14,

                          fontWeight:
                          FontWeight.w700,

                        ),

                      ),


                    ),

                  ),




                  Positioned(

                    top: 14,

                    right: 14,


                    child:
                    FavoriteActionButton(

                      item: favoriteItem,

                      size: 42,

                    ),

                  ),


                ],

              ),






              Padding(

                padding:
                const EdgeInsets.fromLTRB(
                    12,
                    12,
                    12,
                    0
                ),


                child: Row(

                  children: [


                    Expanded(

                      child: Text(

                        title,

                        maxLines: 1,

                        overflow:
                        TextOverflow.ellipsis,


                        style:
                        const TextStyle(

                          color: kPrimaryColor,

                          fontSize: 22,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),

                    ),



                    const Icon(

                      Icons.star,

                      color: Colors.amber,

                      size: 23,

                    ),



                    const SizedBox(width:4),



                    Text(

                      rating.toString(),


                      style:
                      const TextStyle(

                        fontSize:17,

                        fontWeight:
                        FontWeight.w500,

                      ),

                    ),


                  ],

                ),

              ),





              Padding(

                padding:
                const EdgeInsets.fromLTRB(
                    12,
                    6,
                    12,
                    0
                ),


                child: Row(

                  children: [


                    const Icon(

                      Icons.location_on,

                      color:kPrimaryColor,

                      size:18,

                    ),



                    const SizedBox(width:4),



                    Text(

                      location,


                      style:
                      const TextStyle(

                        color:Colors.black54,

                        fontSize:16,

                      ),

                    ),


                  ],

                ),

              ),





              Padding(

                padding:
                const EdgeInsets.fromLTRB(
                    13,
                    8,
                    12,
                    14
                ),


                child: Row(

                  children: [



                    _RestaurantInfoItem(

                      icon: Icons.restaurant_menu,

                      text: type,

                    ),




                    const Spacer(),




                    Container(

                      height:36,

                      width:36,


                      decoration:
                      const BoxDecoration(

                        color:kPrimaryColor,

                        shape:BoxShape.circle,

                      ),


                      child:
                      const Icon(

                        Icons.arrow_forward,

                        color:Colors.white,

                        size:20,

                      ),

                    ),


                  ],

                ),

              ),



            ],

          ),

        ),

      );


    }




    // ================= HOME SMALL CARD =================



    return Padding(

      padding:
      const EdgeInsets.symmetric(horizontal:10),


      child: InkWell(


        onTap: () =>
            context.push(
              route,
              extra: navExtra,
            ),



        child: Container(


          width:250,


          decoration:
          BoxDecoration(

            color:Colors.white,

            borderRadius:
            BorderRadius.circular(18),

          ),



          child: Column(


            crossAxisAlignment:
            CrossAxisAlignment.start,


            children: [



              Stack(

                children: [


                  buildRestaurantImage(

                    height:155,

                    width:double.infinity,


                    borderRadius:
                    BorderRadius.circular(18),

                  ),




                  Positioned(

                    top:10,

                    right:10,


                    child:
                    FavoriteActionButton(

                      item:favoriteItem,

                      size:34,

                    ),

                  ),



                  Positioned(

                    top:0,

                    left:0,


                    child:Container(

                      padding:
                      const EdgeInsets.symmetric(

                        horizontal:10,

                        vertical:7,

                      ),


                      decoration:
                      const BoxDecoration(

                        color:kPrimaryColor,

                        borderRadius:
                        BorderRadius.only(

                          topLeft:
                          Radius.circular(18),

                          bottomRight:
                          Radius.circular(12),

                        ),

                      ),



                      child:Text(

                        price,


                        style:
                        const TextStyle(

                          color:Colors.white,

                          fontSize:13,

                          fontWeight:
                          FontWeight.w700,

                        ),

                      ),


                    ),

                  ),


                ],

              ),




              const SizedBox(height:10),




              Padding(

                padding:
                const EdgeInsets.symmetric(

                    horizontal:10,

                    vertical:4

                ),


                child:Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,


                  children:[



                    Expanded(

                      child:Text(

                        title,

                        maxLines:1,

                        overflow:
                        TextOverflow.ellipsis,


                        style:
                        const TextStyle(

                          fontSize:20,

                          fontWeight:
                          FontWeight.w700,

                          color:kPrimaryColor,

                        ),

                      ),

                    ),




                    Row(

                      children:[


                        const Icon(

                          Icons.star,

                          color:Colors.amber,

                          size:20,

                        ),



                        const SizedBox(width:5),



                        Text(

                          rating.toString(),

                        ),


                      ],

                    ),


                  ],

                ),

              ),




              Padding(

                padding:
                const EdgeInsets.symmetric(horizontal:4),


                child:Row(

                  children:[


                    const Icon(

                      Icons.location_on,

                      size:20,

                      color:kPrimaryColor,

                    ),



                    Text(

                      location,

                      style:
                      const TextStyle(

                        fontSize:15,

                      ),

                    ),


                  ],

                ),

              ),



            ],

          ),

        ),

      ),

    );


  }

}




class _RestaurantInfoItem extends StatelessWidget {


  final IconData icon;

  final String text;



  const _RestaurantInfoItem({

    required this.icon,

    required this.text,

  });



  @override
  Widget build(BuildContext context) {


    return Row(

      children:[


        Icon(

          icon,

          color:kPrimaryColor,

          size:20,

        ),



        const SizedBox(width:5),



        Text(

          text,

          style:
          const TextStyle(

            color:kPrimaryColor,

            fontSize:15,

            fontWeight:FontWeight.w600,

          ),

        ),


      ],

    );


  }

}