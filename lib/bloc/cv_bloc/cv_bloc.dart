import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/bloc/cv_bloc/cv_state.dart';
import 'package:cv_app/data/my_models/cv/cv_model.dart';
import 'package:cv_app/data/repositories/cv_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  CvBloc(this._cvRepository) : super(CvState.initial()) {
    on<CvGenerateEvent>(_cvGenerate);
    on<CvBasicsSaveEvent>(_basicsSave);
    on<CvLocationSaveEvent>(_locationSave);
    on<CvMetaSaveEvent>(_metaSave);
    on<CvChangeProfileEvent>(_changeProfile);
    on<CvChangeEducationEvent>(_changeEducation);
    on<CvChangeWorkEvent>(_changeWork);
    on<CvChangeProjectsEvent>(_changeProject);
    on<CvChangeCertificateEvent>(_changeCertificate);
    on<CvChangeSkillEvent>(_changeSkill);
    on<CvChangeSoftSkillEvent>(_changeSoftSkill);
    on<CvChangeLanguageEvent>(_changeLanguage);
    on<CvChangeInterestEvent>(_changeInterest);
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
      salary: state.salary,
      jobLocation: state.jobLocation,
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

  void _changeProfile(CvChangeProfileEvent event, emit) {
    emit(state.copyWith(profiles: event.profileModel));
  }

  void _changeWork(CvChangeWorkEvent event, emit) {
    emit(state.copyWith(workModels: event.workModel));
  }

  void _changeProject(CvChangeProjectsEvent event, emit) {
    emit(state.copyWith(projects: event.projectModels));
  }

  void _changeCertificate(CvChangeCertificateEvent event, emit) {
    emit(state.copyWith(certificates: event.certificatesModels));
  }

  void _changeSkill(CvChangeSkillEvent event, emit) {
    emit(state.copyWith(skills: event.skillModels));
  }

  void _changeSoftSkill(CvChangeSoftSkillEvent event, emit) {
    emit(state.copyWith(softSkills: event.softSkillModels));
  }

  void _changeLanguage(CvChangeLanguageEvent event, emit) {
    emit(state.copyWith(languages: event.languageModels));
  }

  void _changeInterest(CvChangeInterestEvent event, emit) {
    emit(state.copyWith(interests: event.interestModels));
  }

  void _changeEducation(CvChangeEducationEvent event, emit) {
    emit(state.copyWith(educations: event.educationModels));
  }
}
