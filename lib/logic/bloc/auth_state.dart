part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthError extends AuthState {

  final String error;

  AuthError({required this.error});
}
class AuthLoginSuccess extends AuthState {}
class AuthRegisterSuccess extends AuthState {}
class AuthWrongPassword extends AuthState {}
