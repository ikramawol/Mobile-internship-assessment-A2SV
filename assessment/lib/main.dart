import 'package:assessment/features/grocery/data/data_source/local_data_source.dart';
import 'package:assessment/features/grocery/data/data_source/remote_data_source.dart';
import 'package:assessment/features/grocery/data/repository/grocery_repository_impl.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:assessment/features/grocery/presentaion/bloc/grocery_bloc.dart';
import 'package:assessment/features/grocery/presentaion/pages/home.dart';
import 'package:assessment/features/grocery/presentaion/pages/splash_screen.dart';
import 'package:assessment/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  
  runApp(const GroceryApp());

  WidgetsFlutterBinding
      .ensureInitialized();
  setUp();
}

class GroceryApp extends StatefulWidget {
  const GroceryApp({super.key});

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GroceryBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
