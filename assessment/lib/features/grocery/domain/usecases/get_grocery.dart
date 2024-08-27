import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/domain/entities/grocery.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';

class GetGrocery {
  final GroceryRepository repository;

  GetGrocery(this.repository);

  @override
  Future<Either<Failure, GroceryEntity>> execute(String id) async {
    return await repository.getGrocery(id);
  }
}