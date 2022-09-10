part of 'restaurant_detail_cubit.dart';

abstract class RestaurantDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class RestaurantDetailInitial extends RestaurantDetailState {}

class RestaurantDetailError extends RestaurantDetailState {}

class RestaurantDetailLoading extends RestaurantDetailState {}

class RestaurantDetailSuccess extends RestaurantDetailState {
  final DetailRestaurant detailRestaurant;

  RestaurantDetailSuccess({required this.detailRestaurant});

  @override
  List<Object> get props => [detailRestaurant];
}
