import 'package:cv_app/data/models/file_status/file_status_model.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:equatable/equatable.dart';

class DownloadCvState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final FromStatus fromStatus;
  final FileStatusModel fileStatusModel;

  const DownloadCvState({
    required this.fileStatusModel,
    required this.errorText,
    required this.message,
    required this.statusMessage,
    required this.fromStatus,
  });

  DownloadCvState copyWith({
    String? errorText,
    String? statusMessage,
    String? message,
    FromStatus? fromStatus,
    FileStatusModel? fileStatusModel,
  }) {
    return DownloadCvState(
      fileStatusModel: fileStatusModel ?? this.fileStatusModel,
      errorText: errorText ?? this.errorText,
      message: message ?? this.message,
      statusMessage: statusMessage ?? this.statusMessage,
      fromStatus: fromStatus ?? this.fromStatus,
    );
  }

  @override
  List<Object?> get props => [
        fileStatusModel,
        errorText,
        message,
        statusMessage,
        fromStatus,
      ];
}
