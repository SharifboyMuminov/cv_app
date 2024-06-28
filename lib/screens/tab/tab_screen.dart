import 'package:cv_app/data/local/storage_repository.dart';
import 'package:cv_app/screens/auth/sign_up/sing_up_screen.dart';
import 'package:cv_app/screens/tab/all_cv/all_cvs_screen.dart';
import 'package:cv_app/screens/tab/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int currentIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const AllCvsScreen(),
      ProfileScreen(
        context1: context,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        transitionBuilder: (context, c) {
          return FadeTransition(opacity: c, child: context);
        },
        duration: const Duration(milliseconds: 250),
        child: screens[currentIndex],
      ),
      backgroundColor: CupertinoColors.systemGrey5,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        padding: EdgeInsets.zero,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: CupertinoButton(
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.house,
                      color: currentIndex == 0
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemGrey,
                      size: 22.sp,
                    ),
                    const Spacer(),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: currentIndex == 0
                            ? CupertinoColors.activeBlue
                            : CupertinoColors.systemGrey,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: CupertinoButton(
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.profile_circled,
                      color: currentIndex == 1
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemGrey,
                      size: 22.sp,
                    ),
                    const Spacer(),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: currentIndex == 1
                            ? CupertinoColors.activeBlue
                            : CupertinoColors.systemGrey,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    if (StorageRepository.getString(key: "access_token")
                        .isNotEmpty) {
                      currentIndex = 1;
                    } else {
                      showDialog(
                          context: context,
                          builder: (c) {
                            return AlertDialog.adaptive(
                              title: const Text(
                                "OOPS",
                                style: TextStyle(letterSpacing: 1),
                              ),
                              content: const Text(
                                  "You need to login to view your profile!"),
                              actions: [
                                CupertinoButton(
                                    child: const Text(
                                      "Orqaga",
                                      style: TextStyle(
                                          color: CupertinoColors.activeBlue,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    onPressed: () {
                                      Navigator.of(c).pop();
                                    }),
                                CupertinoButton(
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: CupertinoColors.activeBlue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {
                                      Navigator.of(c).pop();

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (c) {
                                        return const SignUpScreen();
                                      }));
                                    })
                              ],
                            );
                          });
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
