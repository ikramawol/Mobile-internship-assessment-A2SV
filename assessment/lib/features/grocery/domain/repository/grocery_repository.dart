import 'dart:core';

import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/domain/entities/grocery.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class GroceryRepository{
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries();
  Future<Either<Failure, GroceryEntity>> getGrocery(String id);
  // Future<Either<Failure, void>> addGrocery(GroceryEntity grocery);
  // Future<Either<Failure, void>> deleteGrocery(String id);
  // Future<Either<Failure, GroceryEntity>> updateGrocery(GroceryEntity grocery);
  
}