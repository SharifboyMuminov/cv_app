import 'dart:convert';
import 'dart:io';
import 'package:cv_app/data/api/api_client.dart';
import 'package:cv_app/data/local/storage_repository.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/data/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiProvider extends ApiClient {
  //TODO Start Auth ------------------------------------------------------------

  Future<NetworkResponse> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Response response = await dio.post(
        'https://api.cvmaker.uz/v1/users/register',
        data: jsonEncode(
            {"email": email, "full_name": fullName, "password": password}),
      );

      int statusCode = (response.statusCode ?? 400);

      if (statusCode < 200 || statusCode > 300) {
        networkResponse.errorText =
            response.data["message"] as String? ?? "Error :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = "With this Email already exists.";
    }

    return networkResponse;
  }

  Future<NetworkResponse> verify({
    required String email,
    required String activateCode,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    // debugPrint("${email} --------");
    // debugPrint("${activateCode} --------");
    try {
      Response response = await dio.get(
        'https://api.cvmaker.uz/v1/users/verify',
        queryParameters: {"code": activateCode, "email": email},
      );

      if ((response.statusCode ?? 400) >= 200 &&
          (response.statusCode ?? 400) <= 300) {
        debugPrint("${response.data} -------------");
        StorageRepository.setString(
          key: "user_id",
          value: response.data["id"] as String? ?? "",
        );
        StorageRepository.setString(
          key: "access_token",
          value: response.data["access_token"] as String? ?? "",
        );
        networkResponse.data = UserModel.fromJson(response.data);
      } else {
        networkResponse.errorText =
            response.data["message"] as String? ?? "Error password :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      if (error is DioException) {
        networkResponse.errorText = "invalid password";
        // networkResponse.errorText = error.message ?? "invalid password :(";
      } else {
        networkResponse.errorText = "catch (error) :(";
      }
    }

    return networkResponse;
  }

  Future<NetworkResponse> login({
    required String email,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      debugPrint("Password: $email");
      Response response = await dio.post(
        'https://api.cvmaker.uz/v1/users/login',
        data: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        StorageRepository.setString(
          key: "user_id",
          value: response.data["id"] as String? ?? "",
        );
        StorageRepository.setString(
          key: "access_token",
          value: response.data["access_token"] as String? ?? "",
        );

        // networkResponse.data = UserModel.fromJson(response.data);
      } else {
        networkResponse.errorText =
            response.data["message"] as String? ?? "Error Login :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = "No user or error emil or password :(";
    }

    return networkResponse;
  }

  Future<NetworkResponse> forgetPassword({required String email}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Response response = await dio
          .get('https://api.cvmaker.uz/v1/users/set/{email}?email=$email');

      int statusCode = (response.statusCode ?? 400);

      if (statusCode < 200 && statusCode > 300) {
        networkResponse.errorText =
            response.data["message"] as String? ?? "Error Login :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = "catch (error)";
    }

    return networkResponse;
  }

  Future<NetworkResponse> forgetPasswordCode({
    required String email,
    required String activeCode,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Response response = await dio.get(
          'https://api.cvmaker.uz/v1/users/code?code=$activeCode&email=$email');

      int statusCode = (response.statusCode ?? 400);

      if (statusCode < 200 && statusCode > 300) {
        networkResponse.errorText =
            response.data["message"] as String? ?? "Error Login :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = "Invalid code :(";
    }

    return networkResponse;
  }

  Future<NetworkResponse> forgetSetPassword({
    required String email,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Response response = await dio.put(
        'https://api.cvmaker.uz/v1/users/password?email=$email&password=$password',
      );

      int statusCode = (response.statusCode ?? 400);

      if (statusCode >= 200 && statusCode <= 300) {
        StorageRepository.setString(
          key: "user_id",
          value: response.data["id"] as String? ?? "",
        );
        StorageRepository.setString(
          key: "access_token",
          value: response.data["id"] as String? ?? "",
        );
        networkResponse.data = UserModel.fromJson(response.data);
      } else {
        networkResponse.errorText =
            response.data["message"] as String? ?? "Error password :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = "Invalid code :(";
    }

    return networkResponse;
  }

// TODO uploadImage -----------------------

  Future<NetworkResponse> uploadImage(File file) async {
    final fileName = file.path.split('/').last;
    NetworkResponse networkResponse = NetworkResponse();
    try {
      // debugPrint("MyId:  $myId ----------------- ");
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        )
      });
      Response response = await secureDio.post(
        "https://api.cvmaker.uz/v1/media/user-photo",
        data: formData,
      );

      int statusCode = (response.statusCode ?? 400);

      if (statusCode >= 200 && statusCode <= 300) {
        debugPrint("Good: ${response.data} -----------");
        networkResponse.data = response.data;
      } else {
        debugPrint("Error: ${response.statusCode}   -------------");
        networkResponse.errorText = "Error :(";
      }
    } catch (e) {
      // debugPrint(e.toString());
      networkResponse.errorText = "Boshqa xatolik: $e";
    }

    return networkResponse;
  }

  //TODO User ------------------------

  Future<NetworkResponse> getUser() async {
    NetworkResponse networkResponse = NetworkResponse();

    String userId = StorageRepository.getString(key: "user_id");

    if (userId.isEmpty) {
      // debugPrint("empty_user_id");
      networkResponse.errorText = "empty_user_id";
      return networkResponse;
    }

    try {
      Response response =
          await dio.get("https://api.cvmaker.uz/v1/users/$userId");

      int statusCode = (response.statusCode ?? 400);

      if (statusCode >= 200 && statusCode <= 300) {
        // debugPrint("Good: ${response.data} -----------");
        networkResponse.data = UserModel.fromJson(response.data);
      } else {
        // debugPrint("Error: ${response.statusCode}   -------------");
        networkResponse.errorText = "Error :(";
      }
    } on SocketException {
      // debugPrint("No Internet connection");

      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      // debugPrint("Invalid code :(");

      networkResponse.errorText = "Invalid code :(";
    }
    return networkResponse;
  }
}