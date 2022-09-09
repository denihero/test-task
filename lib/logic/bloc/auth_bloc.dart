import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/logic/requests.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<RegisterEvent>((event, emit) async{
      emit(AuthLoading());
      try{
        var registerResult = await register(event.email, event.nickname, event.phoneNumber, event.password);
        emit(AuthRegisterSuccess());
      }catch(e,s) {
        print(e);
        print(s);
        emit(AuthError(error: e.toString()));

      }
    });

    on<LoginEvent>((event, emit) async{
      emit(AuthLoading());
      try{
        var loginResult = await login(event.email, event.password);
        emit(AuthLoginSuccess());
      }catch(e,s){
        print(e);
        emit(AuthError(error:e.toString()));
      }
    });
  }
}
