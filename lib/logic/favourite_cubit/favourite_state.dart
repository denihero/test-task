part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteError extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final RestaurantInfo restaurant;

  FavouriteSuccess({required this.restaurant});

  @override
  List<Object> get props => [restaurant];
}
