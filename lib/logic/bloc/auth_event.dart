part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent{
  final String email;
  final String nickname;
  final String phoneNumber;
  final String password;

  RegisterEvent({required this.email,required this.nickname,required this.phoneNumber,required this.password});
}
class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
