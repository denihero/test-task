import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:test_task/logic/model/auth_model.dart';
import 'package:test_task/logic/requests.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with  HydratedMixin{
  AuthBloc() : super(AuthInitial()) {

    on<RegisterEvent>((event, emit) async {
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

    on<LoginEmailEvent>((event, emit) async{
      emit(AuthLoading());
      try{
        var loginResult = await loginViaEmail(event.email, event.password);
        emit(AuthLoginSuccess(auth: loginResult));
      }catch(e,s){
        print(e);
        emit(AuthError(error:e.toString()));
      }
    });

    on<LoginNickNameEvent>((event, emit) async{
      emit(AuthLoading());
      try{
        var loginResult = await loginViaNickname(event.nickname, event.password);
        emit(AuthLoginSuccess(auth: loginResult));
      }catch(e,s){
        print(e);
        emit(AuthError(error:e.toString()));
      }
    });

    on<AuthLogout>((event, emit) {
      emit(AuthLoading());
      emit(AuthInitial(),);
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    if(state is AuthLoginSuccess){
      return state.fromMap(json);
    }else{
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if(state is AuthLoginSuccess){
      return state.toJson();
    }else{
      return null;
    }
  }
}
