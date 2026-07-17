class HotelModel {
  final int id;
  final String name;
  final String description;
  final String location;
  final String services;
  final String openingTime;
  final String closingTime;
  final CountryModel country;
  final CityModel city;
  final List<HotelImageModel> images;

  HotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.services,
    required this.openingTime,
    required this.closingTime,
    required this.country,
    required this.city,
    required this.images,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      services: json['services'] ?? '',
      openingTime: json['opening_time'] ?? '',
      closingTime: json['closing_time'] ?? '',
      country: CountryModel.fromJson(json['country']),
      city: CityModel.fromJson(json['city']),
      images: (json['images'] as List)
          .map((e) => HotelImageModel.fromJson(e))
          .toList(),
    );
  }
}

class CountryModel {
  final int id;
  final String name;

  CountryModel({
    required this.id,
    required this.name,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}

class CityModel {
  final int id;
  final String name;

  CityModel({
    required this.id,
    required this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}

class HotelImageModel {
  final int id;
  final String url;

  HotelImageModel({
    required this.id,
    required this.url,
  });

  factory HotelImageModel.fromJson(Map<String, dynamic> json) {
    return HotelImageModel(
      id: json['id'],
      url: json['url'] ?? '',
    );
  }
}