part of 'restaurant_cubit.dart';

abstract class RestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}
class RestaurantError extends RestaurantState {}
class RestaurantLoading extends RestaurantState {}

class RestaurantSuccess extends RestaurantState {
  final List<RestaurantInfo> restaurant;

  RestaurantSuccess({required this.restaurant});

  @override
  List<Object> get props => [restaurant];
}
