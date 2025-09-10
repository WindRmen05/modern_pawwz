import 'package:flutter/material.dart';

// Dummy Data Model
class Product {
  final String name;
  final double price;
  final String image;
  final String type;
  final double rating;

  Product({required this.name, required this.price, required this.image, required this.type, required this.rating});
}

// Provider Class
class PetShopNotifier with ChangeNotifier {
  List<Product> latestItems = [
    Product(
        name: "Taste Of The Wild High Prairie Canine Grain-Free Recipe",
        price: 30.20,
        image: "assets/dog_food.png",
        type: "Dog Food",
        rating: 4.8),
    Product(
        name: "Meow Mix Tender Centers Dry Cat Food, Salmon",
        price: 12.0,
        image: "assets/cat_food.png",
        type: "Cat Food",
        rating: 4.9),
    Product(
        name: "Double-Tuff Durable Treat Stuffer Dog Chew Toy",
        price: 25.99,
        image: "assets/dog_toy.png",
        type: "Accessories",
        rating: 4.7),
  ];
}