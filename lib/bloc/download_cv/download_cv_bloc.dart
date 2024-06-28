import 'package:cv_app/bloc/download_cv/download_cv_event.dart';
import 'package:cv_app/bloc/download_cv/download_cv_state.dart';
import 'package:cv_app/data/models/file_status/file_status_model.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/data/repositories/download_cv_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';

class DownloadCvBloc extends Bloc<DownloadCvEvent, DownloadCvState> {
  DownloadCvBloc(this._downloadCvRepository)
      : super(
          DownloadCvState(
            fileStatusModel: FileStatusModel(
              newFileLocation: '',
              isExist: false,
            ),
            errorText: "",
            message: "",
            statusMessage: "",
            fromStatus: FromStatus.pure,
          ),
        ) {
    on(_downloadCvNew);
  }

  final DownloadCvRepository _downloadCvRepository;

  Future<void> _downloadCvNew(DownloadCvNewEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _downloadCvRepository.downloadFile(
      urlFile: event.downloadUrl,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          fileStatusModel: networkResponse.data,
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
