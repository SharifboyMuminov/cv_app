import 'package:cv_app/bloc/user/user_event.dart';
import 'package:cv_app/bloc/user/user_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/data/models/user/user_model.dart';
import 'package:cv_app/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository)
      : super(
          UserState(
            userModel: UserModel.innit(),
            fromStatus: FromStatus.pure,
            message: "",
            errorText: "",
            statusMessage: "",
          ),
        ) {
    on<UserGetEvent>(_userCall);
    on<UserUpdateEvent>(_userUpdate);
  }

  final UserRepository _userRepository;

  Future<void> _userCall(UserGetEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _userRepository.getUser();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          userModel: networkResponse.data,
        ),
      );
    } else {
      if (networkResponse.errorText == "empty_user_id") {
        emit(
          state.copyWith(
            fromStatus: FromStatus.unauthenticated,
            errorText: networkResponse.errorText,
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
  }

  _userUpdate(UserUpdateEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
    NetworkResponse networkResponse =
        await _userRepository.putUser(name: event.name, phone: event.phone);
    if(networkResponse.errorText.isEmpty){
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          userModel: networkResponse.data,
        ),
      );
    }
  }
}
