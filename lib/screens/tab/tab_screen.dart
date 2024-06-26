import 'package:cv_app/screens/auth/widget/auth_input.dart';
import 'package:cv_app/screens/tab/all_cv/all_cvs_screen.dart';
import 'package:cv_app/screens/tab/profile/profile_screen.dart';
import 'package:cv_app/screens/widget/zoom_tap.dart';
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
  int currentIndex = 1;
  List<Widget> screens = [
    const AllCvsScreen(),
    const ProfileScreen(),
  ];
  String _selectedOption = 'Online';

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
        floatingActionButton: ScaleOnPress(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              enableDrag: true,
              backgroundColor: CupertinoColors.systemGrey5,
              showDragHandle: true,
              context: context,
              builder: (ctx) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setModalState) {
                    return Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: CupertinoColors.systemGrey5,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AuthMyInput(
                              textEditingController: TextEditingController(),
                              hintText: "Full name",
                              maxLength: 30,
                            ),
                            AuthMyInput(
                              textEditingController: TextEditingController(),
                              hintText: "Age",
                            ),
                            AuthMyInput(
                              textEditingController: TextEditingController(),
                              hintText: "Number",
                            ),
                            AuthMyInput(
                              textEditingController: TextEditingController(),
                              hintText: "User name",
                            ),
                            AuthMyInput(
                              textEditingController: TextEditingController(),
                              hintText: "Job",
                            ),
                            AuthMyInput(
                              textInputAction: TextInputAction.done,
                              textEditingController: TextEditingController(),
                              hintText: "Ish tajribasi",
                            ),
                            AuthMyInput(
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number,
                              digitsOnly: true,
                              textEditingController: TextEditingController(),
                              hintText: "Maosh",
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                      color: CupertinoColors.activeOrange)),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('Online'),
                                    onTap: () {
                                      setModalState(() {
                                        _selectedOption = "Online";
                                      });
                                    },
                                    leading: Radio<String>(
                                      value: 'Online',
                                      groupValue: _selectedOption,
                                      onChanged: (String? value) {
                                        setModalState(() {
                                          _selectedOption = value!;
                                        });
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 0.55,
                                    color: CupertinoColors.systemOrange.withOpacity(.5),
                                  ),
                                  ListTile(
                                    title: Text('Offline'),
                                    onTap: () {
                                      setModalState(() {
                                        _selectedOption = "Offline";
                                      });
                                    },
                                    leading: Radio<String>(
                                      value: 'Offline',
                                      groupValue: _selectedOption,
                                      onChanged: (String? value) {
                                        setModalState(() {
                                          _selectedOption = value!;
                                        });
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 0.55,
                                    color: CupertinoColors.systemOrange.withOpacity(.5),

                                  ),
                                  ListTile(
                                    title: const Text('Ok'),
                                    onTap: () {
                                      setModalState(() {
                                        _selectedOption = "Ok";
                                      });
                                    },
                                    leading: Radio<String>(
                                      value: 'Ok',
                                      groupValue: _selectedOption,
                                      onChanged: (String? value) {
                                        setModalState(() {
                                          _selectedOption = value!;
                                        });
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          scaleValue: 0.9,
          child: Container(
            margin: EdgeInsets.all(4.sp),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CupertinoColors.systemOrange,
            ),
            height: 65.0,
            width: 65.0,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
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
                      currentIndex = 1;
                      print(currentIndex);
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
