import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/models/network_response.dart';

class AuthRepository {
  AuthRepository(this._apiProvider);

  final ApiProvider _apiProvider;

  Future<NetworkResponse> register({
    required String email,
    required String password,
    required String fullName,
  }) =>
      _apiProvider.register(
        email: email,
        password: password,
        fullName: fullName,
      );

  Future<NetworkResponse> verify({
    required String email,
    required int activateCode,
  }) =>
      _apiProvider.verify(
        email: email,
        activateCode: activateCode,
      );

  Future<NetworkResponse> login({
    required String email,
    required String password,
  }) =>
      _apiProvider.login(
        email: email,
        password: password,
      );
}
