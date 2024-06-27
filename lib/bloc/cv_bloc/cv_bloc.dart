import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/bloc/cv_bloc/cv_state.dart';
import 'package:cv_app/data/my_models/certificate/certificate_model.dart';
import 'package:cv_app/data/my_models/cv/cv_model.dart';
import 'package:cv_app/data/my_models/interest/interest_model.dart';
import 'package:cv_app/data/my_models/language/language_model.dart';
import 'package:cv_app/data/my_models/profile/profiles_model.dart';
import 'package:cv_app/data/my_models/project/project_model.dart';
import 'package:cv_app/data/my_models/skill/skill_model.dart';
import 'package:cv_app/data/my_models/soft_skill/soft_skill_model.dart';
import 'package:cv_app/data/my_models/work/work_model.dart';
import 'package:cv_app/data/repositories/cv_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  CvBloc(this._cvRepository) : super(CvState.initial()) {
    on<CvGenerateEvent>(_cvGenerate);
    on<CvBasicsSaveEvent>(_basicsSave);
    on<CvLocationSaveEvent>(_locationSave);
    on<CvMetaSaveEvent>(_metaSave);
    on<CvAddOrRemoveProfileEvent>(_addOrRemoveProfile);
    on<CvAddOrRemoveWorkEvent>(_addOrRemoveWork);
    on<CvAddOrRemoveProjectsEvent>(_addOrRemoveProject);
    on<CvAddOrRemoveCertificateEvent>(_addOrRemoveCertificate);
    on<CvAddOrRemoveSkillEvent>(_addOrRemoveSkill);
    on<CvAddOrRemoveSoftSkillEvent>(_addOrRemoveSoftSkill);
    on<CvAddOrRemoveLanguageEvent>(_addOrRemoveLanguage);
    on<CvAddOrRemoveInterestEvent>(_addOrRemoveInterest);
  }

  final CvRepository _cvRepository;

  _cvGenerate(CvGenerateEvent event, emit) async {
    CvModel cvModel = CvModel(
      metaModel: state.metaModel,
      basicsModel: state.basicsModel.copyWith(
        location: state.locationModel,
        profiles: state.profiles,
      ),
      workModels: state.workModels,
      languageModels: state.languages,
      interestModels: state.interests,
      projectModels: state.projects,
      skillModels: state.skills,
      softSkillModels: state.softSkills,
      educationModels: state.educations,
      certificateModels: state.certificates,
      salary: 0,
      jobLocation: '',
    );
  }

  void _basicsSave(CvBasicsSaveEvent event, emit) {
    emit(
      state.copyWith(
        basicsModel: event.basicsModel,
        jobLocation: event.jobLocation,
        salary: event.salary,
      ),
    );
  }

  void _locationSave(CvLocationSaveEvent event, emit) {
    emit(state.copyWith(locationModel: event.locationModel));
  }

  void _metaSave(CvMetaSaveEvent event, emit) {
    emit(state.copyWith(metaModel: event.metaModel));
  }

  void _addOrRemoveProfile(CvAddOrRemoveProfileEvent event, emit) {
    List<ProfileModel> p = state.profiles;

    if (event.isRemove) {
      p.remove(event.profileModel);
    } else {
      p.add(event.profileModel);
    }

    emit(state.copyWith(profiles: p));
  }

  void _addOrRemoveWork(CvAddOrRemoveWorkEvent event, emit) {
    List<WorkModel> p = state.workModels;
    if (event.isRemove) {
      p.remove(event.workModel);
    } else {
      p.add(event.workModel);
    }

    emit(state.copyWith(workModels: p));
  }

  void _addOrRemoveProject(CvAddOrRemoveProjectsEvent event, emit) {
    List<ProjectModel> p = state.projects;

    if (event.isRemove) {
      p.remove(event.projectModel);
    } else {
      p.add(event.projectModel);
    }
    emit(state.copyWith(projects: p));
  }

  void _addOrRemoveCertificate(CvAddOrRemoveCertificateEvent event, emit) {
    List<CertificatesModel> p = state.certificates;

    if (event.isRemove) {
      p.remove(event.certificatesModel);
    } else {
      p.add(event.certificatesModel);
    }

    emit(state.copyWith(certificates: p));
  }

  void _addOrRemoveSkill(CvAddOrRemoveSkillEvent event, emit) {
    List<SkillModel> p = state.skills;

    if (event.isRemove) {
      p.remove(event.skillModel);
    } else {
      p.add(event.skillModel);
    }

    emit(state.copyWith(skills: p));
  }

  void _addOrRemoveSoftSkill(CvAddOrRemoveSoftSkillEvent event, emit) {
    List<SoftSkillModel> p = state.softSkills;

    if (event.isRemove) {
      p.remove(event.softSkillModel);
    } else {
      p.add(event.softSkillModel);
    }

    emit(state.copyWith(softSkills: p));
  }

  void _addOrRemoveLanguage(CvAddOrRemoveLanguageEvent event, emit) {
    List<LanguageModel> p = state.languages;

    if (event.isRemove) {
      p.remove(event.languageModel);
    } else {
      p.add(event.languageModel);
    }

    emit(state.copyWith(languages: p));
  }

  void _addOrRemoveInterest(CvAddOrRemoveInterestEvent event, emit) {
    List<InterestModel> p = state.interests;

    if (event.isRemove) {
      p.remove(event.interestModel);
    } else {
      p.add(event.interestModel);
    }

    emit(state.copyWith(interests: p));
  }
}
