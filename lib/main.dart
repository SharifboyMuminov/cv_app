import 'dart:io';
import 'package:cv_app/screens/tab/tab_screen.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const mat.Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: child,
        );
      },
      child: const TabScreen(),
    );
  }
}
