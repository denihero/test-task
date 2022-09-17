import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/logic/requests.dart';

part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit() : super(AddToFavInitial());

  var dioClient = DioClient();

  Future<void> saveRestaurant(String token, int id) async {
    emit(AddToFavLoading());
    try {
     await dioClient.addToFavourite(token, id);
      emit(AddToFavSuccess());
    } catch (e, s) {
      print(e);
      print(s);
      emit(AddToFavError());
    }
  }

  Future<void> deleteFavourite(String token, int id) async {
    emit(AddToFavLoading());
    try {
      await dioClient.deleteFromFavourite(token, id);
      emit(AddToFavSuccess());
    } catch (e, s) {
      print(e);
      print(s);
      emit(AddToFavError());
    }
  }
}
