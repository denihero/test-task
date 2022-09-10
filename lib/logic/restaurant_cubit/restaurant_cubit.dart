import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/logic/model/restaurant.dart';
import 'package:test_task/logic/requests.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());

  void getRestaurant(String token) async{
    emit(RestaurantLoading());
    try{
      var result = await fetchRestaurant(token);
      emit(RestaurantSuccess(restaurant: result));
    }catch(e,s){
      print(s);
      print(e);
      emit(RestaurantError());
    }
  }
}
