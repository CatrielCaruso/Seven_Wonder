// To parse this JSON data, do
//
//     final wonder = wonderFromJson(jsonString);

import 'dart:convert';

List<Wonder> wonderFromJson(String str) =>
    List<Wonder>.from(json.decode(str).map((x) => Wonder.fromJson(x)));

String wonderToJson(List<Wonder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wonder {
  Wonder({
    this.city,
    this.description,
    this.country,
    this.image,
    this.id,
    this.name,
  });

  String city;
  String description;
  String country;
  String image;
  int id;
  String name;

  factory Wonder.fromJson(Map<String, dynamic> json) => Wonder(
        city: json["city"],
        description: json["description"],
        country: json["country"],
        image: json["image"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "description": description,
        "country": country,
        "image": image,
        "id": id,
        "name": name,
      };
}
