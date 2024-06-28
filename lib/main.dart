import 'package:cv_app/app/app.dart';
import 'package:cv_app/data/local/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  StorageRepository.instance;

  runApp(App());
}
