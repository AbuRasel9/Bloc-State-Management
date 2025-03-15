part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailChangeEvent extends LoginEvent {
  EmailChangeEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class PasswordChangeEvent extends LoginEvent {
  PasswordChangeEvent({required this.password});

  final String password;

  @override
  List<Object?> get props => [];
}

class AuthEvent extends LoginEvent {
}
