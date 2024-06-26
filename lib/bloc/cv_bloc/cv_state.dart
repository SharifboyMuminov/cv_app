import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/my_models/basics/basics_model.dart';
import 'package:equatable/equatable.dart';

class CvState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final FromStatus fromStatus;

  const CvState({
    required this.errorText,
    required this.fromStatus,
    required this.statusMessage,
    required this.message,
  });

  @override
  List<Object?> get props => [
        fromStatus,
        errorText,
        statusMessage,
        message,
      ];
}
