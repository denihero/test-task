import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/model/detail_restaurant.dart';
import 'package:test_task/logic/requests.dart';

part 'restaurant_detail_state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  RestaurantDetailCubit() : super(RestaurantDetailInitial());

  Future<void> getRestaurantDetail(String token, int id) async {
    emit(RestaurantDetailLoading());
    try {
      var result = await DioClient().fetchRestaurantDetail(token, id);
      emit(RestaurantDetailSuccess(detailRestaurant: result));
    } catch (e, s) {
      print(s);
      print(e);
      emit(RestaurantDetailError());
    }
  }
}
