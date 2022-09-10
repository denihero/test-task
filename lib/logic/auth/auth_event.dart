part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String nickname;
  final String phoneNumber;
  final String password;

  RegisterEvent(
      {required this.email,
      required this.nickname,
      required this.phoneNumber,
      required this.password});
}

class LoginEmailEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEmailEvent({required this.email, required this.password});
}

class LoginNickNameEvent extends AuthEvent {
  final String nickname;
  final String password;

  LoginNickNameEvent({required this.nickname, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}
