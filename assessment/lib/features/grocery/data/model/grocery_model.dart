import 'package:assessment/features/grocery/domain/entities/grocery.dart';




class GroceryModel extends GroceryEntity {
  GroceryModel({
    required String id,
    required String title,
    required String imageUrl,
    required double rating,
    required int price,
    required int discount,
    required String description,
    required List<OptionModel> options,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          rating: rating,
          price: price,
          discount: discount,
          description: description,
          options: options.map((optionModel) => optionModel.toOptionEntity()).toList(),
        );

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    var optionsFromJson = json['options'] as List;
    List<OptionModel> optionsList = optionsFromJson.map((i) => OptionModel.fromJson(i)).toList();

    return GroceryModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
      price: json['price'],
      discount: json['discount'],
      description: json['description'],
      options: optionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options.map((option) => OptionModel.fromEntity(option).toJson()).toList(),
    };
  }

  @override
  GroceryEntity toEntity() {
    return GroceryEntity(
      id: id,
      title: title,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      discount: discount,
      description: description,
      options: options,
    );
  }

  static GroceryModel fromEntity(GroceryEntity grocery) {
    return GroceryModel(
      id: grocery.id,
      title: grocery.title,
      imageUrl: grocery.imageUrl,
      rating: grocery.rating,
      price: grocery.price,
      discount: grocery.discount,
      description: grocery.description,
      options: grocery.options.map((option) => OptionModel.fromEntity(option)).toList(),
    );
  }
}

class OptionModel extends Option {
  OptionModel({
    required String id,
    required String name,
    required double price,
  }) : super(
          id: id,
          name: name,
          price: price,
        );

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  
  static OptionModel fromEntity(Option option) {
    return OptionModel(
      id: option.id,
      name: option.name,
      price: option.price,
    );
  }

  Option toOptionEntity() {
    return Option(
      id: id,
      name: name,
      price: price,
    );
  }
}
