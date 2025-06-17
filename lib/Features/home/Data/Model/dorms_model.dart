import 'dart:convert';

class DormsModel {
  DormsModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.images,
    required this.description,
    required this.address,
    required this.icerik,
    required this.icerik2,
    required this.imkan1,
    required this.imkan2,
    required this.latitude,
    required this.longitude,
    required this.budget,
    required this.roomType,
    required this.dormType,
    required this.isFeatured,
    required this.price,
    required this.city,
    required this.googlePlaceId,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String rating;
  final List<String> images;
  final String description;
  final dynamic address;
  final String icerik;
  final String icerik2;
  final String imkan1;
  final String imkan2;
  final String latitude;
  final String longitude;
  final int budget;
  final String roomType;
  final String dormType;
  final int isFeatured;
  final dynamic price;
  final String city;
  final dynamic googlePlaceId;
  final dynamic ownerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DormsModel.fromJson(Map<String, dynamic> json) {
    return DormsModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      rating: json["rating"] ?? "",
      images: _parseImages(json["images"]),
      description: json["description"] ?? "",
      address: json["address"],
      icerik: json["icerik"] ?? "",
      icerik2: json["icerik2"] ?? "",
      imkan1: json["imkan1"] ?? "",
      imkan2: json["imkan2"] ?? "",
      latitude: json["latitude"] ?? "",
      longitude: json["longitude"] ?? "",
      budget: json["budget"] ?? 0,
      roomType: json["room_type"] ?? "",
      dormType: json["dorm_type"] ?? "",
      isFeatured: json["is_featured"] ?? 0,
      price: json["price"],
      city: json["city"] ?? "",
      googlePlaceId: json["google_place_id"],
      ownerId: json["owner_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  static List<String> _parseImages(dynamic imagesData) {
    if (imagesData == null) return [];

    if (imagesData is List) {
      return imagesData.map((e) => e.toString()).toList();
    }

    if (imagesData is String) {
      try {
        final List<dynamic> parsedList = jsonDecode(imagesData);
        return parsedList.map((e) => e.toString()).toList();
      } catch (e) {
        return imagesData.isEmpty ? [] : [imagesData];
      }
    }

    return [];
  }

  String get firstImage {
    if (images.isNotEmpty) {
      return images.first;
    }
    return 'https://via.placeholder.com/650x433?text=No+Image'; 
  }

  bool get hasImages => images.isNotEmpty;

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "rating": rating,
    "images": jsonEncode(images),
    "description": description,
    "address": address,
    "icerik": icerik,
    "icerik2": icerik2,
    "imkan1": imkan1,
    "imkan2": imkan2,
    "latitude": latitude,
    "longitude": longitude,
    "budget": budget,
    "room_type": roomType,
    "dorm_type": dormType,
    "is_featured": isFeatured,
    "price": price,
    "city": city,
    "google_place_id": googlePlaceId,
    "owner_id": ownerId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
