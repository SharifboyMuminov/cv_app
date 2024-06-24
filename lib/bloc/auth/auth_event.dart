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

class AuthResetPasswordConfirmEvent extends AuthEvent {
  final String email;
  final String activationCode;
  final String newPassword;
  final String confirmPassword;

  AuthResetPasswordConfirmEvent({
    required this.email,
    required this.confirmPassword,
    required this.newPassword,
    required this.activationCode,
  });

  @override
  List<Object?> get props => [
        email,
        confirmPassword,
        newPassword,
        activationCode,
      ];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        password,
        email,
      ];
}
