import 'package:bloc/bloc.dart';
import 'package:flutter_mandiriapp/models/user_model.dart';
import 'package:flutter_mandiriapp/service/api_service.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await ApiService().login(email, password);
      if (user.status == "success") {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailed(user.msg.toString()));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
