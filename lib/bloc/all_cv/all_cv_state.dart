import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/resume/resume_model.dart';
import 'package:equatable/equatable.dart';

class AllCvState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final FromStatus fromStatus;
  final List<ResumeModel> currentResumes;
  final List<ResumeModel> allResumes;

  const AllCvState({
    required this.currentResumes,
    required this.allResumes,
    required this.errorText,
    required this.fromStatus,
    required this.statusMessage,
    required this.message,
  });

  AllCvState copyWith({
    String? errorText,
    String? statusMessage,
    String? message,
    FromStatus? fromStatus,
    List<ResumeModel>? currentResumes,
    List<ResumeModel>? allResumes,
  }) {
    return AllCvState(
      errorText: errorText ?? this.errorText,
      fromStatus: fromStatus ?? this.fromStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      message: message ?? this.message,
      currentResumes: currentResumes ?? this.currentResumes,
      allResumes: allResumes ?? this.allResumes,
    );
  }

  @override
  List<Object?> get props => [
        errorText,
        fromStatus,
        statusMessage,
        message,
        allResumes,
        currentResumes,
      ];
}
