abstract class GroceryEvent {}

class FetchGrocery extends GroceryEvent {}

class FetchSingleGrocery extends GroceryEvent {
  final String id;

  FetchSingleGrocery(this.id);
}