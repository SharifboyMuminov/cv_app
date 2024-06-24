import 'package:cv_app/bloc/auth/auth_event.dart';
import 'package:cv_app/bloc/auth/auth_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          const AuthState(
            fromStatus: FromStatus.pure,
            errorText: "",
            statusMessage: "",
            message: '',
            userEmail: '',
            userPassword: '',
          ),
        ) {
    on<AuthRegisterEvent>(_register);
    on<AuthVerifyEvent>(_verify);
    on<AuthLoginEvent>(_login);
    on<AuthResetPasswordEvent>(_resetPassword);
    on<AuthResetPasswordConfirmEvent>(_resetPasswordConfirm);
  }

  Future<void> _register(AuthRegisterEvent event, emit) async {
    emit(state.copyWith(
      fromStatus: FromStatus.loading,
    ));
  }

  Future<void> _verify(AuthVerifyEvent event, emit) async {}

  Future<void> _login(AuthLoginEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
  }

  Future<void> _resetPassword(AuthResetPasswordEvent event, emit) async {
    emit(
      state.copyWith(
        fromStatus: FromStatus.loading,
        statusMessage: "",
      ),
    );
  }

  Future<void> _resetPasswordConfirm(
      AuthResetPasswordConfirmEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
  }
}
