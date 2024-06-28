import 'package:cv_app/app/app.dart';

import 'package:cv_app/server/file_menager_server.dart';
import 'package:cv_app/data/local/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FileManagerService.instance;

  StorageRepository.instance;

  runApp(App());
}
