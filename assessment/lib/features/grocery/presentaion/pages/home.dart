import 'package:assessment/features/grocery/presentaion/bloc/grocery_bloc.dart';
import 'package:assessment/features/grocery/presentaion/bloc/grocery_state.dart';
import 'package:assessment/features/grocery/presentaion/widget/cards.dart';
import 'package:assessment/features/grocery/presentaion/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/burgerIcon.png', height: 20),
              const SizedBox(width: 8),
              const Text('Burger', style: TextStyle(color: Colors.black)),
            ],
        
          ),

        ),
      ),
      body: Column(
        children: [
          SearchField(),
          Expanded(
            child: BlocBuilder<GroceryBloc, GroceryState>(
              builder: (context, state) {
                if (state is GroceryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GroceryLoaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.7, // Adjust as needed
                    ),
                    itemCount: state.groceries.length,
                    itemBuilder: (context, index) {
                      final grocery = state.groceries[index];
                      return Cards(grocery: grocery);
                    },
                  );
                } else if (state is GroceryError) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('No data available'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
