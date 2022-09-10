part of 'add_to_fav_cubit.dart';

abstract class AddToFavState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToFavInitial extends AddToFavState {}

class AddToFavError extends AddToFavState {}

class AddToFavLoading extends AddToFavState {}

class AddToFavSuccess extends AddToFavState {}
