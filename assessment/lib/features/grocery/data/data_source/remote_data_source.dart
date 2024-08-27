import 'dart:convert';

import 'package:assessment/core/constant/constant.dart';
import 'package:assessment/core/error/exception.dart';
import 'package:assessment/features/grocery/data/model/grocery_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class RemoteDataSource {
  Future<List<GroceryModel>> getAllGroceries();
  Future<GroceryModel> getGrocery(String id);
  // Future<void> addGrocery(GroceryModel grocery);
  // Future<void> deleteGrocery(String id);
  // Future<GroceryModel> updateGrocery(GroceryModel grocery);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({required this.client});
  late final http.Client client;
  late final InternetConnectionChecker internetConnectionChecker;

  
  @override
  Future<List<GroceryModel>> getAllGroceries() async {
    final response = await client.get(Uri.parse(Urls.baseUrl));

    if (response.statusCode == 200){
      final Map<String, dynamic> decodeJson = json.decode(response.body);
      final List<dynamic> groceries = decodeJson['data'];

      return groceries.map((json) => GroceryModel.fromJson(json)).toList();
    }else{
      throw ServerException();
    }
  }
  
  @override
  Future<GroceryModel> getGrocery(String id) async{
    
    final response = await client.get(Uri.parse('${Urls.baseUrl}/$id'));

    if (response.statusCode == 200){
      final decodeJson = json.decode(response.body);
      return GroceryModel.fromJson(decodeJson);
    }else{
    throw ServerException();
  }
  }

  // @override
  // Future<GroceryModel> updateGrocery(GroceryModel grocery) async{
  //   // TODO: implement updateGrocery
  //   throw UnimplementedError();
  // }

}

