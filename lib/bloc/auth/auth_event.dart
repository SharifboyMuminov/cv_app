import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String fullName;
  final String password;

  AuthRegisterEvent({
    required this.email,
    required this.fullName,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        fullName,
        password,
      ];
}

class AuthVerifyEvent extends AuthEvent {
  final String activateCode;

  AuthVerifyEvent({required this.activateCode});

  @override
  List<Object?> get props => [activateCode];
}

class AuthResetPasswordEvent extends AuthEvent {
  final String email;

  AuthResetPasswordEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class AuthForgetPasswordCodeEvent extends AuthEvent {
  final String email;
  final String activeCode;

  AuthForgetPasswordCodeEvent({
    required this.email,
    required this.activeCode,
  });

  @override
  List<Object?> get props => [email, activeCode];
}

class AuthForgetSetPasswordEvent extends AuthEvent {
  final String email;
  final String newPassword;

  AuthForgetSetPasswordEvent({
    required this.email,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [email, newPassword];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [password, email];
}
