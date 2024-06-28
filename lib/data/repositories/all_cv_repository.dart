import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/models/network_response.dart';

class AllCvRepository {

  AllCvRepository(this._apiProvider);


  final ApiProvider _apiProvider;



  Future<NetworkResponse> getAllCv() => _apiProvider.cllAllCv();
}