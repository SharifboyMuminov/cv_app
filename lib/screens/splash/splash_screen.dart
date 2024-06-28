import 'package:cv_app/bloc/user/user_bloc.dart';
import 'package:cv_app/bloc/user/user_event.dart';
import 'package:cv_app/data/local/storage_repository.dart';
import 'package:cv_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:cv_app/screens/tab/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!StorageRepository.getBool(key: "isLogin")) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: const TabScreen(),
              duration: const Duration(seconds: 1),
              type: PageTransitionType.fade,
              alignment: Alignment.center,
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    context.read<UserBloc>().add(UserGetEvent());
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/lotties/splash.json",
        ),
      ),
    );
  }
}
