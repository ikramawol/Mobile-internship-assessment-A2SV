import 'package:assessment/features/grocery/domain/entities/grocery.dart';

abstract class GroceryState {}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GroceryLoaded extends GroceryState {
  final List<GroceryEntity> groceries;

  GroceryLoaded(this.groceries);
}
class GrocerySingleLoaded extends GroceryState {
  final GroceryEntity grocery;

  GrocerySingleLoaded(this.grocery);
}

class GroceryError extends GroceryState {
  final String message;

  GroceryError(this.message);
}
