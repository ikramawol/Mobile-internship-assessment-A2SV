import 'dart:convert';

import 'package:assessment/features/grocery/data/model/grocery_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<GroceryModel>> cacheAllGroceries();
  Future<GroceryModel> cacheGrocery(String id);
  // Future<void> addGrocery(GroceryModel grocery);
  // Future<void> deleteGrocery(String id);
  // Future<GroceryModel> updateGrocery(GroceryModel grocery);
}

class LocalDataSourceImpl implements LocalDataSource {
  // late final http.Client client;
  late final SharedPreferences sharedPreferences;
  LocalDataSourceImpl({required this.sharedPreferences});

  final cachedGrocery = 'cachedGrocery';

  Future<List<GroceryModel>> _getCachedGroceries() async {
    final jsonString = sharedPreferences.getString(cachedGrocery);
    if (jsonString != null) {
      return (json.decode(jsonString) as List)
          .map((item) => GroceryModel.fromJson(item))
          .toList();
    } else {
      return [];
    }
  }
  @override
  Future<List<GroceryModel>> cacheAllGroceries() async {
    return _getCachedGroceries();
  }
  
  @override
  Future<GroceryModel> cacheGrocery(String id) async{
    
    final groceries = await _getCachedGroceries();
    return groceries.firstWhere((element) => element.id == id);
  }
}