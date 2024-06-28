import 'dart:io';

import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/models/network_response.dart';

class UserRepository {
  final ApiProvider _apiProvider;

  UserRepository(this._apiProvider);

  Future<NetworkResponse> getUser() => _apiProvider.getUser();
  Future<NetworkResponse> uploadPhotoUser({required File file}) =>
      _apiProvider.uploadImage(file);
  Future<NetworkResponse> putUser(
          {required String name, required String phone}) =>
      _apiProvider.editProfile(name: name, phone: phone);
}
