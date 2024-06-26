import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final FromStatus fromStatus;
  final UserModel userModel;

  const UserState({
    required this.userModel,
    required this.fromStatus,
    required this.message,
    required this.errorText,
    required this.statusMessage,
  });

  UserState copyWith(
      {String? errorText,
      String? statusMessage,
      String? message,
      FromStatus? fromStatus,
      UserModel? userModel}) {
    return UserState(
      fromStatus: fromStatus ?? this.fromStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
      message: message ?? this.message,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
        fromStatus,
        errorText,
        statusMessage,
        message,
      ];
}
