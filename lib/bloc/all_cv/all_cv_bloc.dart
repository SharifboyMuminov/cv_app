import 'package:cv_app/bloc/all_cv/all_cv_event.dart';
import 'package:cv_app/bloc/all_cv/all_cv_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/data/repositories/all_cv_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCvBloc extends Bloc<AllCvEvent, AllCvState> {
  AllCvBloc(this._allCvRepository)
      : super(
          const AllCvState(
            errorText: "",
            fromStatus: FromStatus.pure,
            statusMessage: "",
            message: "",
            currentResumes: [],
            allResumes: [],
          ),
        ) {
    on<AllCvCallEvent>(_allCvCall);
  }

  final AllCvRepository _allCvRepository;

  Future<void> _allCvCall(AllCvCallEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _allCvRepository.getAllCv();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          currentResumes: networkResponse.data,
          allResumes: networkResponse.data,
          fromStatus: FromStatus.success,
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
}
