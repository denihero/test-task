import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/logic/requests.dart';

part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit() : super(AddToFavInitial());

  void saveRestaurant(String token,int id) async{
    emit(AddToFavLoading());
    try{
      var result = await addToFavourite(token, id);
      emit(AddToFavSuccess());
    }catch(e,s){
      print(e);
      print(s);
      emit(AddToFavError());
    }
  }

  void deleteFavourite(String token,int id) async{
    emit(AddToFavLoading());
    try{
      var result = await deleteFromFavourite(token, id);
      emit(AddToFavSuccess());
    }catch(e,s){
      print(e);
      print(s);
      emit(AddToFavError());
    }
  }
}
