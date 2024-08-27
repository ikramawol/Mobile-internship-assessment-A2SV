import 'package:assessment/core/error/exception.dart';
import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/data/data_source/local_data_source.dart';
import 'package:assessment/features/grocery/data/data_source/remote_data_source.dart';
import 'package:assessment/features/grocery/domain/entities/grocery.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GroceryRepositoryImpl extends GroceryRepository {
  final RemoteDataSource remoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;
  final LocalDataSource localDataSource;

  GroceryRepositoryImpl(
    this.remoteDataSource, 
    this.internetConnectionChecker, 
    this.localDataSource,
  );

  @override
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries() async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final result = await remoteDataSource.getAllGroceries();
        await localDataSource.cacheAllGroceries(); // Corrected this line
        final groceryEntities = result.map((model) => model.toEntity()).toList();
        return Right(groceryEntities);
      } on ServerException {
        return Left(ServerFailure(message: 'Failed to load from server'));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      try {
        final result = await localDataSource.cacheAllGroceries(); // Fetch from cache
        final groceryEntities = result.map((model) => model.toEntity()).toList();
        return Right(groceryEntities);
      } on CacheException {
        return Left(CacheFailure(message: 'Failed to load from cache'));
      }
    }
  }

  @override
  Future<Either<Failure, GroceryEntity>> getGrocery(String id) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final result = await remoteDataSource.getGrocery(id); // Added `id` parameter
        await localDataSource.cacheGrocery(result.id); // Corrected this line
        return Right(result.toEntity());
      } on ServerException {
        return Left(ServerFailure(message: 'Failed to load from server'));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      try {
        final result = await localDataSource.cacheGrocery(id); // Fetch from cache
        return Right(result.toEntity());
      } on CacheException {
        return Left(CacheFailure(message: 'Failed to load from cache'));
      }
    }
  }
}
