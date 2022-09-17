import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/logic/model/auth_model.dart';
import 'package:test_task/logic/requests.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getProfile(String token) async {
    emit(ProfileLoading());
    try {
      var result = await DioClient().fetchProfile(token);
      emit(ProfileSuccess(profile: result));
    } catch (e, s) {
      print(e);
      print(s);
      emit(ProfileError());
    }
  }
}
