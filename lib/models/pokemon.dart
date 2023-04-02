import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String image;
  final String category;
  final String weight;
  final String height;
  final String abilities;

  bool isMyFav = false;

  Pokemon(this.name, this.image, this.category, this.weight, this.height,
      this.abilities, this.isMyFav);

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(json['name'], json['image'], json['category'],
        json['weight'], json['height'], json['abilities'], false);
  }
}
