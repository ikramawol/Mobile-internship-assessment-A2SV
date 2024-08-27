import 'package:assessment/features/grocery/presentaion/bloc/grocery_event.dart';
import 'package:assessment/features/grocery/presentaion/bloc/grocery_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';


class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GroceryRepository groceryRepository;

  GroceryBloc(this.groceryRepository) : super(GroceryInitial()) {
    on<FetchGrocery>(_onFetchGrocery);
    on<FetchSingleGrocery>(_onFetchSingleGrocery);
  }

  Future<void> _onFetchGrocery(FetchGrocery event, Emitter<GroceryState> emit) async {
    emit(GroceryLoading());

    try {
      final groceries = await groceryRepository.getAllGroceries();
      groceries.fold(
        (failure) => emit(GroceryError(failure.toString())),
        (grocery) => emit(GroceryLoaded(grocery)),
      );
    } catch (e) {
      emit(GroceryError(e.toString()));
    }
  }

   Future<void> _onFetchSingleGrocery(FetchSingleGrocery event, Emitter<GroceryState> emit) async {
    emit(GroceryLoading());

    try {
      final grocery = await groceryRepository.getGrocery(event.id);
      grocery.fold(
        (failure) => emit(GroceryError(failure.toString())),
        (grocery) => emit(GrocerySingleLoaded(grocery)),
      );
    } catch (e) {
      emit(GroceryError(e.toString()));
    }
  }


}
