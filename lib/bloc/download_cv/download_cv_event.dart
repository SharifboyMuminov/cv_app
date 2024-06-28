import 'package:equatable/equatable.dart';

abstract class DownloadCvEvent extends Equatable {}

class DownloadCvNewEvent extends DownloadCvEvent {
  final String downloadUrl;

  DownloadCvNewEvent({required this.downloadUrl});

  @override
  List<Object?> get props => [downloadUrl];
}
