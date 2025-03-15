part of 'login_bloc.dart';

enum LoginStatus { progress, loading, error, success }

class LoginState extends Equatable {
  const LoginState({
    this.message = "",
    this.email = "",
    this.password = "",
    this.status = LoginStatus.progress,
  });

  final String email;
  final String password;
  final LoginStatus status;
  final String message;

  LoginState copyWith(
      {String? message, String? email, String? password, LoginStatus? status}) {
    return LoginState(
      message: message ?? this.message,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [email, password, status];
}
