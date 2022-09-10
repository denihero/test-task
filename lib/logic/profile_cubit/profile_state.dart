part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileError extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final Profile profile;

  ProfileSuccess({required this.profile});

  @override
  List<Object> get props => [profile];
}
