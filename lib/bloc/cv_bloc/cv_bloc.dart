import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/bloc/cv_bloc/cv_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/data/my_models/cv/cv_model.dart';
import 'package:cv_app/data/my_models/meta/meta_model.dart';
import 'package:cv_app/data/repositories/cv_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  CvBloc(this._cvRepository) : super(CvState.initial()) {
    on<CvGenerateEvent>(_cvGenerate,transformer: droppable());
    on<CvBasicsSaveEvent>(_basicsSave,transformer: droppable());
    on<CvChangeImageFileEvent>(_cvChangeImageFile,transformer: droppable());
    on<CvInitialEvent>(_cvInitial,transformer: droppable());
    on<CvChangPdfStyleEvent>(_changePdfStyle,transformer: droppable());
    on<CvLocationSaveEvent>(_locationSave,transformer: droppable());
    on<CvMetaSaveEvent>(_metaSave,transformer: droppable());
    on<CvChangeProfileEvent>(_changeProfile,transformer: droppable());
    on<CvChangeEducationEvent>(_changeEducation,transformer: droppable());
    on<CvChangeWorkEvent>(_changeWork,transformer: droppable());
    on<CvChangeProjectsEvent>(_changeProject,transformer: droppable());
    on<CvChangeCertificateEvent>(_changeCertificate,transformer: droppable());
    on<CvChangeSkillEvent>(_changeSkill,transformer: droppable());
    on<CvChangeSoftSkillEvent>(_changeSoftSkill,transformer: droppable());
    on<CvChangeLanguageEvent>(_changeLanguage,transformer: droppable());
    on<CvChangeInterestEvent>(_changeInterest,transformer: droppable());
  }

  final CvRepository _cvRepository;

  _cvInitial(CvInitialEvent event, emit) {
    emit(CvState.initial());
  }

  _cvChangeImageFile(CvChangeImageFileEvent event, emit) {
    emit(
      state.copyWith(
        imageFile: event.imageFile,
      ),
    );
  }

  Future<void> _cvGenerate(CvGenerateEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
    NetworkResponse networkResponseOne = NetworkResponse();
    if (state.imageFile != null) {
      networkResponseOne = await _cvRepository.uploadImage(
        file: state.imageFile!,
      );
    }

    CvModel cvModel = CvModel(
      metaModel: state.metaModel,
      basicsModel: state.basicsModel.copyWith(
        location: state.locationModel,
        profiles: state.profiles,
        image: networkResponseOne.data as String? ?? "",
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

    NetworkResponse networkResponse =
        await _cvRepository.generateCv(cvModel: cvModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          pdfUrl: networkResponse.data,
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

  void _changePdfStyle(CvChangPdfStyleEvent event, emit) {
    emit(
      state.copyWith(
        metaModel: MetaModel(
          template: event.pdfStyleName,
        ),
      ),
    );
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
