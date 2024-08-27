import 'package:assessment/features/grocery/data/data_source/local_data_source.dart';
import 'package:assessment/features/grocery/data/data_source/remote_data_source.dart';
import 'package:assessment/features/grocery/data/repository/grocery_repository_impl.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:assessment/features/grocery/domain/usecases/get_all_grocery.dart';
import 'package:assessment/features/grocery/domain/usecases/get_grocery.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final http.Client client = http.Client();

  // Register dependencies
  getIt.registerLazySingleton<InternetConnectionChecker>(() => internetConnectionChecker);
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<http.Client>(() => client);

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
    // internetConnectionChecker: getIt<InternetConnectionChecker>(),
    client: getIt<http.Client>(),
  ));

  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(
    sharedPreferences: getIt<SharedPreferences>(),
  ));

  getIt.registerLazySingleton<GroceryRepository>(() => GroceryRepositoryImpl(
    getIt<RemoteDataSource>(),
    getIt<InternetConnectionChecker>(),
    getIt<LocalDataSource>(),
  ));

  getIt.registerLazySingleton<GetGrocery>(() => GetGrocery(getIt<GroceryRepository>()));
  getIt.registerLazySingleton<GetAllGroceries>(() => GetAllGroceries(getIt<GroceryRepository>()));
}
