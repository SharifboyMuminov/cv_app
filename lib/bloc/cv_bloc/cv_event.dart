import 'package:cv_app/data/my_models/basics/basics_model.dart';
import 'package:cv_app/data/my_models/certificate/certificate_model.dart';
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

  CvBasicsSaveEvent({required this.basicsModel});

  @override
  List<Object?> get props => [basicsModel];
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

class CvAddOrRemoveProfileEvent extends CvEvent {
  final ProfileModel profileModel;
  final bool isRemove;

  CvAddOrRemoveProfileEvent({
    required this.profileModel,
    required this.isRemove,
  });

  @override
  List<Object?> get props => [profileModel, isRemove];
}

class CvAddOrRemoveWorkEvent extends CvEvent {
  final WorkModel workModel;
  final bool isRemove;

  CvAddOrRemoveWorkEvent({required this.workModel, required this.isRemove});

  @override
  List<Object?> get props => [workModel, isRemove];
}

class CvAddOrRemoveProjectsEvent extends CvEvent {
  final ProjectModel projectModel;
  final bool isRemove;

  CvAddOrRemoveProjectsEvent(
      {required this.projectModel, required this.isRemove});

  @override
  List<Object?> get props => [projectModel, isRemove];
}

class CvAddOrRemoveCertificateEvent extends CvEvent {
  final CertificatesModel certificatesModel;
  final bool isRemove;

  CvAddOrRemoveCertificateEvent(
      {required this.certificatesModel, required this.isRemove});

  @override
  List<Object?> get props => [certificatesModel, isRemove];
}

class CvAddOrRemoveSkillEvent extends CvEvent {
  final SkillModel skillModel;
  final bool isRemove;

  CvAddOrRemoveSkillEvent({
    required this.skillModel,
    required this.isRemove,
  });

  @override
  List<Object?> get props => [skillModel, isRemove];
}

class CvAddOrRemoveSoftSkillEvent extends CvEvent {
  final SoftSkillModel softSkillModel;
  final bool isRemove;

  CvAddOrRemoveSoftSkillEvent({
    required this.softSkillModel,
    required this.isRemove,
  });

  @override
  List<Object?> get props => [softSkillModel, isRemove];
}

class CvAddOrRemoveLanguageEvent extends CvEvent {
  final LanguageModel languageModel;
  final bool isRemove;

  CvAddOrRemoveLanguageEvent({
    required this.languageModel,
    required this.isRemove,
  });

  @override
  List<Object?> get props => [languageModel, isRemove];
}

class CvAddOrRemoveInterestEvent extends CvEvent {
  final InterestModel interestModel;
  final bool isRemove;

  CvAddOrRemoveInterestEvent({
    required this.interestModel,
    required this.isRemove,
  });

  @override
  List<Object?> get props => [interestModel, isRemove];
}
