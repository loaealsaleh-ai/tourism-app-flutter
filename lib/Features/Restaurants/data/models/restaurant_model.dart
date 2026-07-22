class RestaurantModel {

  final int id;
  final String name;
  final String description;
  final String location;
  final String type;
  final String openTime;
  final String closeTime;
  final String country;
  final String city;
  final List<String> images;

  // مؤقت لأن الـ API لا يحتوي rating
  final double rating;


  const RestaurantModel({

    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.type,
    required this.openTime,
    required this.closeTime,
    required this.country,
    required this.city,
    required this.images,
    required this.rating,

  });



  // حتى يعمل RestaurantView
  String get image {

    if(images.isNotEmpty){
      return images.first;
    }

    return '';

  }



  factory RestaurantModel.fromJson(
      Map<String,dynamic> json
      ){

    return RestaurantModel(

      id: json['id'] ?? 0,

      name:
      json['name'] ?? '',


      description:
      json['description'] ?? '',


      location:
      json['location'] ?? '',


      type:
      json['type'] ?? '',


      openTime:
      json['open_time'] ?? '',


      closeTime:
      json['close_time'] ?? '',



      country:
      json['country']?['name'] ?? '',



      city:
      json['city']?['name'] ?? '',



      images:
      (json['images'] as List<dynamic>?)
          ?.map((e){

        if(e is String){
          return e;
        }


        if(e is Map<String,dynamic>){

          return e['image']?.toString()
              ??
              e['url']?.toString()
              ??
              '';

        }


        return '';

      })
          .where((e)=>e.isNotEmpty)
          .toList()
          ??
          [],



      // مؤقت
      rating:
      (json['rating'] ?? 0).toDouble(),

    );

  }

}