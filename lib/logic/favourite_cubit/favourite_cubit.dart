import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/logic/model/restaurant.dart';
import 'package:test_task/logic/requests.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  void getFavourite(String token) async{
    emit(FavouriteLoading());
    try{
      var resultFavourite = await fetchFavourite(token);
      emit(FavouriteSuccess(restaurant: resultFavourite));
    }catch(e,s){
      print(e);
      print(s);
      emit(FavouriteError());
    }
  }
}
