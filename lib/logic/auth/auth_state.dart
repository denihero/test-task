part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {

  final Auth? auth;
  const AuthState({this.auth});

  Map<String,dynamic> toJson() {
    return {'auth': auth};
  }

  fromMap(Map<String,dynamic> map) {
    return AuthLoginSuccess(auth: map['auth'] as Auth);
  }



  @override
  List<Object> get props => [auth!];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthError extends AuthState {

  final String error;

  AuthError({required this.error});
}
class AuthLoginSuccess extends AuthState {
  final Auth auth;


  const AuthLoginSuccess({required this.auth});

  @override
  List<Object> get props => [auth];

}
class AuthRegisterSuccess extends AuthState {}
class AuthWrongPassword extends AuthState {}
