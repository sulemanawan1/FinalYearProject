// To parse this JSON data, do
//
//     final flower = flowerFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

Flower flowerFromJson(String str) => Flower.fromJson(json.decode(str));

String flowerToJson(Flower data) => json.encode(data.toJson());

class Flower {
  Flower({

   @required this.name,
    @required this.color,
    @required this.month,
    @required this.season,
    @required  this.growtime,
    @required this.height,
    @required this.category,
    @required  this.lifetime,
    @required  this.shape,
    @required  this.fragrance,
    @required this.altitude,
    @required this.area,
    @required this.id,
  });

  String? name;
  String? color;
  String? month;
  String? season;
  String? growtime;
  String? height;
  String? category;
  String? shape;
  String? fragrance;
  String? lifetime;
  String? altitude;
  String? area;
  int? id;

  factory Flower.fromJson(Map<String, dynamic> json) => Flower(
    name: json["name"],
    color: json["color"],
    month: json["month"],
    season: json["season"],
    growtime: json["growtime"],
    height: json["height"],
    category: json["category"],
    shape: json["shape"],
    fragrance: json["fragrance"],
    lifetime: json["lifetime"],
    altitude: json["altitude"],
    area: json["area"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
    "month": month,
    "season": season,
    "growtime": growtime,
    "height": height,
    "category": category,
    "shape": shape,
    "fragrance": fragrance,
    "lifetime": lifetime,
    "altitude": altitude,
    "area": area,
    "id": id,
  };
}
