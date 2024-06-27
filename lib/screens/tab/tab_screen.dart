import 'package:cv_app/screens/tab/all_cv/all_cvs_screen.dart';
import 'package:cv_app/screens/tab/profile/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
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
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                        "home".tr(),
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
                        "profile".tr(),
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
                      currentIndex = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
