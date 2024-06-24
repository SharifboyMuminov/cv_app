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

      if (response.statusCode != 201) {
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
    try {
      Response response = await dio.post(
        'https://api.cvmaker.uz/v1/users/verify?code=$activateCode&email=$email',
      );

      if (response.statusCode == 200) {
        debugPrint("${response.data} -------------");
        StorageRepository.setString(
          key: "user_id",
          value: response.data["id"] as String? ?? "",
        );
        networkResponse.data = UserModel.fromJson(response.data);
      } else {
        networkResponse.errorText = "Error password :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      // debugPrint("${error}  ----------------");
      networkResponse.errorText = "Error activate code or email";
    }

    return networkResponse;
  }

  Future<NetworkResponse> login({
    required String email,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      debugPrint("Password: $password");
      Response response = await dio.post(
        'https://api.cvmaker.uz/v1/users/login',
        data: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        StorageRepository.setString(
          key: "user_id",
          value: response.data["id"] as String? ?? "",
        );

        networkResponse.data = UserModel.fromJson(response.data);
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

//TODO End Auth ------------------------------------------------------------

//TODO start App info ------------------------------------------------------------

  Future<NetworkResponse> getAppInfo() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.get(
        'https://nuqtalar.idrok.group/api/infos/info/',
      );

      if (response.statusCode == 200) {
        // networkResponse.data = (response.data["results"] as List?)
        //         ?.map((e) => AppInfoModel.fromJson(e))
        //         .toList() ??
        //     [];
      } else {
        networkResponse.errorText = "Error :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

//TODO End App info ------------------------------------------------------------

//TODO Start Book  ------------------------------------------------------------
  Future<NetworkResponse> fetchBooks() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.get(
        'https://nuqtalar.idrok.group/api/book/?limit=5',
      );

      if (response.statusCode == 200) {
        // networkResponse.data = (response.data["results"] as List?)
        //         ?.map((e) => BookModel.fromJson(e))
        //         .toList() ??
        //     [];
      } else {
        networkResponse.errorText = "Error :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
//TODO End Book  ------------------------------------------------------------
}
