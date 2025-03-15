import 'dart:convert';

import 'package:bloc_state_management/model/login_request.dart';
import 'package:bloc_state_management/repository/auth_repository.dart';
import 'package:bloc_state_management/repository/post_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository = AuthRepository();

  LoginBloc(this.authRepository) : super(LoginState()) {
    on<EmailChangeEvent>(_emailChange);
    on<PasswordChangeEvent>(_passwordChange);
    on<AuthEvent>(_authEvent);
  }

  _emailChange(EmailChangeEvent event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _passwordChange(PasswordChangeEvent event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  Future<void> _authEvent(AuthEvent event, Emitter<LoginState> emit) async {

    final data = LoginRequest(email: state.email, password: state.password);
print("---------------${jsonEncode(data)}");
    emit(
      state.copyWith(
        status: LoginStatus.loading,
      ),
    );
    await authRepository.loginApi("https://reqres.in/api/login", data).then(
      (value) {
        emit(
          state.copyWith(
            status: LoginStatus.success,
            message: "Login Successfull",
          ),
        );
      },
    ).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
        emit(state.copyWith(
            message: error.toString(), status: LoginStatus.error));
      },
    );
  }
}
