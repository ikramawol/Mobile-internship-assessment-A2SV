import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/domain/entities/grocery.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllGroceries {
  final GroceryRepository repository;

  GetAllGroceries(this.repository);

  @override
  Future<Either<Failure, List<GroceryEntity>>> execute() async {
    return await repository.getAllGroceries();
  }
}