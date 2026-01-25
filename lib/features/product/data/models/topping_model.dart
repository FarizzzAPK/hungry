import 'dart:convert';

class ToppingModel {
  final String name;
  final String image;
  final int id;

  ToppingModel({required this.name, required this.image, required this.id});

  factory ToppingModel.fromJson(Map<String, dynamic> json){
    return ToppingModel(
    name: json["name"] ?? '',
    image: json["image"] ?? '',
    id: json["id"]);
  }
}