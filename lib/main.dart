import 'dart:io';
import 'package:cv_app/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cv_app/data/local/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  StorageRepository.instance;

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en", "EN"),
        Locale("uz", "UZ"),
      ],
      path: "assets/translations",
      fallbackLocale:
          (Platform.localeName.split("-").first.toLowerCase() == "uz" ||
                  Platform.localeName.split("-").last.toLowerCase() == "uz")
              ? const Locale("uz", "UZ")
              : const Locale("en", "EN"),
      child: App(),
    ),
  );
}
