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

abstract class CvEvent extends Equatable {}

class CvGenerateEvent extends CvEvent {
  @override
  List<Object?> get props => [];
}

class CvBasicsSaveEvent extends CvEvent {
  final BasicsModel basicsModel;
  final String jobLocation;
  final int salary;

  CvBasicsSaveEvent({
    required this.basicsModel,
    required this.salary,
    required this.jobLocation,
  });

  @override
  List<Object?> get props => [basicsModel, salary, jobLocation];
}

class CvMetaSaveEvent extends CvEvent {
  final MetaModel metaModel;

  CvMetaSaveEvent({required this.metaModel});

  @override
  List<Object?> get props => [metaModel];
}

class CvLocationSaveEvent extends CvEvent {
  final LocationModel locationModel;

  CvLocationSaveEvent({required this.locationModel});

  @override
  List<Object?> get props => [locationModel];
}

class CvChangeProfileEvent extends CvEvent {
  final List<ProfileModel> profileModel;

  CvChangeProfileEvent({
    required this.profileModel,
  });

  @override
  List<Object?> get props => [profileModel];
}

class CvChangeWorkEvent extends CvEvent {
  final List<WorkModel> workModel;

  CvChangeWorkEvent({required this.workModel});

  @override
  List<Object?> get props => [workModel];
}

class CvChangeProjectsEvent extends CvEvent {
  final List<ProjectModel> projectModels;

  CvChangeProjectsEvent({required this.projectModels});

  @override
  List<Object?> get props => [projectModels];
}

class CvChangeCertificateEvent extends CvEvent {
  final List<CertificatesModel> certificatesModels;

  CvChangeCertificateEvent({required this.certificatesModels});

  @override
  List<Object?> get props => [certificatesModels];
}

class CvChangeSkillEvent extends CvEvent {
  final List<SkillModel> skillModels;

  CvChangeSkillEvent({required this.skillModels});

  @override
  List<Object?> get props => [skillModels];
}

class CvChangeSoftSkillEvent extends CvEvent {
  final List<SoftSkillModel> softSkillModels;

  CvChangeSoftSkillEvent({required this.softSkillModels});

  @override
  List<Object?> get props => [softSkillModels];
}

class CvChangeLanguageEvent extends CvEvent {
  final List<LanguageModel> languageModels;

  CvChangeLanguageEvent({required this.languageModels});

  @override
  List<Object?> get props => [languageModels];
}

class CvChangeInterestEvent extends CvEvent {
  final List<InterestModel> interestModels;

  CvChangeInterestEvent({required this.interestModels});

  @override
  List<Object?> get props => [interestModels];
}

class CvChangeEducationEvent extends CvEvent {
  final List<EducationModel> educationModels;

  CvChangeEducationEvent({required this.educationModels});

  @override
  List<Object?> get props => [educationModels];
}
