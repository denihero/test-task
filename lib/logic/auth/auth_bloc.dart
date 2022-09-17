import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:test_task/logic/model/auth_model.dart';
import 'package:test_task/logic/requests.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    var dioClient = DioClient();
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await dioClient.register(
            event.email, event.nickname, event.phoneNumber, event.password);
        emit(AuthRegisterSuccess());
      } catch (e, s) {
        print(e);
        print(s);
        emit(AuthError(error: e.toString()));
      }
    });

    on<LoginEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var loginResult = await dioClient.loginViaEmail(event.email, event.password);
        emit(AuthLoginSuccess(auth: loginResult));
      } catch (e) {
        print(e);
        emit(AuthError(error: e.toString()));
      }
    });

    on<LoginNickNameEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var loginResult =
            await dioClient.loginViaNickname(event.nickname, event.password);
        emit(AuthLoginSuccess(auth: loginResult));
      } catch (e, s) {
        print(e);
        emit(AuthError(error: e.toString()));
      }
    });

    on<AuthLogoutEvent>((event, emit) {
      emit(AuthLoading());
      emit(
        AuthInitial(),
      );
    });
  }
}
