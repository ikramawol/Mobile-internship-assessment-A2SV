
import 'package:assessment/features/grocery/data/model/grocery_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GroceryEntity extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final int price;
  final int discount;
  final String description;
  final List<Option> options;
  
  const GroceryEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });

  @override
  List<Object> get props => [id, title, imageUrl, rating, price, discount, description, options];

}

class Option extends Equatable {
  final String id;
  final String name;
  final double price;
  
  const Option({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  List<Object> get props => [id, name, price];
}