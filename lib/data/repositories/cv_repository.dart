import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/data/my_models/cv/cv_model.dart';

class CvRepository {
  final ApiProvider _apiProvider;

  CvRepository(this._apiProvider);

  Future<NetworkResponse> generateCv({required CvModel cvModel}) =>
      _apiProvider.generateCv(cvModel: cvModel);
}
