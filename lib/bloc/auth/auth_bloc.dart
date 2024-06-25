import 'package:cv_app/bloc/auth/auth_event.dart';
import 'package:cv_app/bloc/auth/auth_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository)
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
    on<AuthResetPasswordEvent>(_forgetPassword);
    on<AuthForgetPasswordCodeEvent>(_forgetPasswordCode);
    on<AuthResetPasswordConfirmEvent>(_resetPasswordConfirm);
  }

  final AuthRepository _authRepository;

  Future<void> _register(AuthRegisterEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _authRepository.register(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          userEmail: event.email,
          fromStatus: FromStatus.success,
          statusMessage: "_register",
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _verify(AuthVerifyEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    // debugPrint("${state.userEmail} --------");
    // debugPrint("${event.activateCode} --------");

    NetworkResponse networkResponse = await _authRepository.verify(
      email: state.userEmail,
      activateCode: event.activateCode,
    );
    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.authenticated,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _login(AuthLoginEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _authRepository.login(
      email: event.email,
      password: event.password,
    );
    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.authenticated,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _forgetPassword(AuthResetPasswordEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse =
        await _authRepository.forgetPassword(email: event.email);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: "_resetPassword",
          fromStatus: FromStatus.success,
          userEmail: event.email,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _forgetPasswordCode(
      AuthForgetPasswordCodeEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _authRepository.forgetPasswordCode(
      email: event.email,
      activeCode: event.activeCode,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: "_forgetPasswordCode",
          fromStatus: FromStatus.success,
          userEmail: event.email,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _resetPasswordConfirm(
      AuthResetPasswordConfirmEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
  }
}
