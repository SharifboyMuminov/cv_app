import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/models/network_response.dart';

class DownloadCvRepository {
  final ApiProvider _apiProvider;

  DownloadCvRepository(this._apiProvider);

  Future<NetworkResponse> downloadFile({required String urlFile}) =>
      _apiProvider.downloadFile(urlPdfFile: urlFile);
}
