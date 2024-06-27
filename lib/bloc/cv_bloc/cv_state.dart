import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/my_models/basics/basics_model.dart';
import 'package:cv_app/data/my_models/certificate/certificate_model.dart';
import 'package:cv_app/data/my_models/education/education_model.dart';
import 'package:cv_app/data/my_models/interest/interest_model.dart';
import 'package:cv_app/data/my_models/language/language_model.dart';
import 'package:cv_app/data/my_models/location/location_model.dart';
import 'package:cv_app/data/my_models/meta/meta_model.dart';
import 'package:cv_app/data/my_models/profile/profiles_model.dart';
import 'package:cv_app/data/my_models/project/project_model.dart';
import 'package:cv_app/data/my_models/skill/skill_model.dart';
import 'package:cv_app/data/my_models/soft_skill/soft_skill_model.dart';
import 'package:cv_app/data/my_models/work/work_model.dart';
import 'package:equatable/equatable.dart';

class CvState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final String jobLocation;
  final int salary;
  final FromStatus fromStatus;
  final BasicsModel basicsModel;
  final LocationModel locationModel;
  final MetaModel metaModel;
  final List<ProfileModel> profiles;
  final List<WorkModel> workModels;
  final List<ProjectModel> projects;
  final List<EducationModel> educations;
  final List<CertificatesModel> certificates;
  final List<SkillModel> skills;
  final List<SoftSkillModel> softSkills;
  final List<LanguageModel> languages;
  final List<InterestModel> interests;

  const CvState({
    required this.salary,
    required this.jobLocation,
    required this.metaModel,
    required this.interests,
    required this.languages,
    required this.skills,
    required this.softSkills,
    required this.certificates,
    required this.educations,
    required this.projects,
    required this.workModels,
    required this.profiles,
    required this.locationModel,
    required this.basicsModel,
    required this.errorText,
    required this.fromStatus,
    required this.statusMessage,
    required this.message,
  });

  CvState copyWith({
    String? errorText,
    String? statusMessage,
    String? message,
    String? jobLocation,
    int? salary,
    FromStatus? fromStatus,
    BasicsModel? basicsModel,
    MetaModel? metaModel,
    LocationModel? locationModel,
    List<ProfileModel>? profiles,
    List<WorkModel>? workModels,
    List<ProjectModel>? projects,
    List<EducationModel>? educations,
    List<CertificatesModel>? certificates,
    List<SkillModel>? skills,
    List<SoftSkillModel>? softSkills,
    List<LanguageModel>? languages,
    List<InterestModel>? interests,
  }) {
    return CvState(
      metaModel: metaModel ?? this.metaModel,
      interests: interests ?? this.interests,
      languages: languages ?? this.languages,
      skills: skills ?? this.skills,
      softSkills: softSkills ?? this.softSkills,
      certificates: certificates ?? this.certificates,
      educations: educations ?? this.educations,
      projects: projects ?? this.projects,
      workModels: workModels ?? this.workModels,
      profiles: profiles ?? this.profiles,
      locationModel: locationModel ?? this.locationModel,
      basicsModel: basicsModel ?? this.basicsModel,
      errorText: errorText ?? this.errorText,
      fromStatus: fromStatus ?? this.fromStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      message: message ?? this.message,
      salary: salary ?? this.salary,
      jobLocation: jobLocation ?? this.jobLocation,
    );
  }

  factory CvState.initial() {
    return CvState(
      interests: const [],
      languages: const [],
      skills: const [],
      softSkills: const [],
      certificates: const [],
      educations: const [],
      projects: const [],
      workModels: const [],
      profiles: const [],
      locationModel: LocationModel.initial(),
      basicsModel: BasicsModel.initial(),
      errorText: "",
      fromStatus: FromStatus.pure,
      statusMessage: "",
      message: "",
      metaModel: MetaModel.initial(),
      salary: 0,
      jobLocation: "",
    );
  }

  @override
  List<Object?> get props => [
        fromStatus,
        jobLocation,
        salary,
        softSkills,
        interests,
        languages,
        skills,
        certificates,
        educations,
        projects,
        errorText,
        statusMessage,
        message,
        basicsModel,
        locationModel,
        profiles,
        workModels,
        metaModel,
      ];
}
