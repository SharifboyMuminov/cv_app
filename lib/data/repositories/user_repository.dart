import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/models/network_response.dart';

class UserRepository {
  final ApiProvider _apiProvider;

  UserRepository(this._apiProvider);

  Future<NetworkResponse> getUser() => _apiProvider.getUser();
}
