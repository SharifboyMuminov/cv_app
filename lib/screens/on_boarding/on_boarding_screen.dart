import 'package:cv_app/data/local/storage_repository.dart';
import 'package:cv_app/screens/auth/sign_up/sing_up_screen.dart';
import 'package:cv_app/screens/on_boarding/firs_page.dart';
import 'package:cv_app/screens/on_boarding/second_page.dart';
import 'package:cv_app/screens/on_boarding/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int activeIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTapUp(TapUpDetails details, BuildContext context) async {
    final screenWidth = MediaQuery.of(context).size.width;
    if (details.globalPosition.dx < screenWidth / 2) {
      if (activeIndex > 0) {
        activeIndex--;
      }
    } else {
      if (activeIndex < 2) {
        activeIndex++;
      } else {
        await StorageRepository.setBool(key: "isLogin", value: true).then((v) {
          Navigator.push(
            context,
            PageTransition(
              child: const SignUpScreen(),
              type: PageTransitionType.fade,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 700),
            ),
          );
        });
      }
    }
    _pageController.animateToPage(
      activeIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTapUp: (details) => _onTapUp(details, context),
            child: Column(
              children: [
                Row(
                  children: List.generate(3, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          minHeight: 5.h,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r)),
                          value: activeIndex == index
                              ? 1
                              : (activeIndex > index ? 1.0 : 0.0),
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              CupertinoColors.activeBlue),
                        ),
                      ),
                    );
                  }),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    children: const [
                      FirsPage(),
                      SecondPage(),
                      ThirdPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
