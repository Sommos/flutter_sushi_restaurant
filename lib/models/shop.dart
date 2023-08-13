import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: 'Original Sushi',
      price: '£7.99',
      imagePath: 'lib/images/original_sushi.png',
      rating: "4.7",
      description: "Indulge in the exquisite harmony of flavors with our Original Sushi, a culinary masterpiece that artfully combines tender slices of premium salmon with seasoned rice, expertly crafted to bring out the ocean's finest essence in every delightful bite. Elevate your sushi experience with the rich, buttery texture of salmon, perfectly complemented by our chef's meticulous attention to detail.",
    ),
    Food(
      name: 'Shrimp Sushi',
      price: '£3.99',
      imagePath: 'lib/images/shrimp_sushi.png',
      rating: "4.8",
      description: "Delight in the succulent harmony of flavors with our Shrimp Sushi, a culinary delight that skillfully combines plump, juicy shrimp with seasoned rice, offering a symphony of taste that captures the essence of the sea in every mouthwatering bite. Experience the perfect balance of textures and flavors as the tender shrimp meets the subtle notes of our handcrafted sushi rice, curated to elevate your sushi journey to new heights.",
    ),
    Food(
      name: 'Tamago Sushi',
      price: '£4.49',
      imagePath: 'lib/images/tomago_sushi.png',
      rating: "4.6",
      description: "Indulge in the exquisite simplicity of our Tamago Sushi, a masterpiece of Japanese cuisine that artfully combines layers of delicate, sweet tamago (Japanese omelette) with impeccably seasoned sushi rice. With each bite, savor the gentle interplay of soft textures and subtle sweetness, offering a taste experience that embodies the essence of traditional Japanese culinary craftsmanship.",
    ),
    Food(
      name: 'Toro Sushi',
      price: '£5.29',
      imagePath: 'lib/images/toro.png',
      rating: "4.1",
      description: "Experience the sublime richness of our Toro Sushi, a culinary delight that showcases the most velvety and succulent cuts of premium fatty tuna. Melt-in-your-mouth tenderness harmonizes with its distinct flavor profile, making each piece a truly exceptional journey into the world of luxurious sushi indulgence.",
    ),
  ];

  final List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for(int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}