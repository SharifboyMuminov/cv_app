import 'dart:ui';
import 'package:cv_app/data/models/language_model.dart';
import 'package:cv_app/screens/tab/profile/generate_cv/widgets/salary_textfield.dart';
import 'package:cv_app/screens/widget/zoom_tap.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/utility_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/widget/auth_input.dart';

class CvGenerateScreen extends StatefulWidget {
  const CvGenerateScreen({super.key});

  @override
  State<CvGenerateScreen> createState() => _CvGenerateScreenState();
}

class _CvGenerateScreenState extends State<CvGenerateScreen> {
  String _selectedOption = 'Online';

  double sliderValue = 0.3;
  List<String> skills = [];
  List<LanguageModel> languages = [];
  TextEditingController skillCtrl = TextEditingController();
  TextEditingController langCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: mat.Size(
            MediaQuery.sizeOf(context).width,
            0.4.h,
          ),
          child: Container(
            height: 0.4.h,
            width: double.infinity,
            color: CupertinoColors.systemGrey,
          ),
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(.7),
        title: Text("cv_generate".tr()),
      ),
      backgroundColor: CupertinoColors.systemGrey5,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleOnPress(
                  onTap: () {
                    takeAnImage(context, limit: 1, images: []);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: EdgeInsets.all(24.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: CupertinoColors.systemGrey)),
                    child: Center(
                      child: Column(
                        children: [
                          const Icon(CupertinoIcons.photo_camera),
                          8.getH(),
                          Text("add_photo".tr())
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            12.getH(),
            AuthMyInput(
              textEditingController: TextEditingController(),
              hintText: "Full name",
              maxLength: 30,
              isCounterShow: true,
            ),
            12.getH(),
            AuthMyInput(
              textEditingController: TextEditingController(),
              hintText: "Age",
              digitsOnly: true,
            ),
            12.getH(),
            MoneyInput(
              isNumber: 1,
              textEditingController: TextEditingController(),
              hintText: "Number",
            ),
            12.getH(),
            AuthMyInput(
              textEditingController: TextEditingController(),
              hintText: "User name",
            ),
            12.getH(),
            AuthMyInput(
              textEditingController: TextEditingController(),
              hintText: "Job",
            ),
            12.getH(),
            Wrap(
              children: [
                ...List.generate(
                  skills.length,
                  (index) {
                    return ScaleOnPress(
                      onLongPressed: () {
                        setState(() {
                          skills.removeAt(index);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 5.w, left: 5.w, bottom: 10.h, top: 5.h),
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: CupertinoColors.systemGrey),
                        ),
                        child: Text(
                          skills[index],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AuthMyInput(
                    textInputAction: TextInputAction.done,
                    textEditingController: skillCtrl,
                    hintText: "Ish tajribasi",
                  ),
                ),
                10.getW(),
                IconButton(
                  style: IconButton.styleFrom(
                      foregroundColor: CupertinoColors.systemOrange,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.he, horizontal: 15.he),
                      backgroundColor: CupertinoColors.systemOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                  onPressed: () {
                    setState(() {
                      if (skillCtrl.text.isNotEmpty &&
                          skillCtrl.text.trim().isNotEmpty) {
                        skills.add(skillCtrl.text.trim());
                        skillCtrl.clear();
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            12.getH(),
            MoneyInput(
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              digitsOnly: true,
              maxLength: null,
              textEditingController: TextEditingController(),
              hintText: "Maosh",
            ),
            12.getH(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: CupertinoColors.activeOrange)),
              child: Column(
                children: [
                  5.getH(),
                  Text(
                    "work_type".tr(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  ListTile(
                    title: Text('online'.tr()),
                    onTap: () {
                      setState(() {
                        _selectedOption = "online".tr();
                      });
                    },
                    leading: Radio<String>(
                      activeColor: CupertinoColors.activeBlue,
                      value: 'online'.tr(),
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
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
                    title: Text('offline'.tr()),
                    onTap: () {
                      setState(() {});
                      _selectedOption = "offline".tr();
                    },
                    leading: Radio<String>(
                      value: 'offline'.tr(),
                      activeColor: CupertinoColors.activeBlue,
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
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
                    title: Text('both'.tr()),
                    onTap: () {
                      setState(() {
                        _selectedOption = "both".tr();
                      });
                    },
                    leading: Radio<String>(
                      activeColor: CupertinoColors.activeBlue,
                      value: 'both'.tr(),
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                ...List.generate(
                  languages.length,
                  (index) {
                    return ScaleOnPress(
                      onLongPressed: () {
                        setState(() {
                          languages.removeAt(index);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 5.w, left: 0.w, bottom: 10.h, top: 5.h),
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: CupertinoColors.systemGrey),
                        ),
                        child: Text(
                          "${languages[index].langName} : ${(languages[index].level * 10).round()}/10",
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            12.getH(),
            Row(
              children: [
                Expanded(
                  child: AuthMyInput(
                    textInputAction: TextInputAction.next,
                    textEditingController: langCtrl,
                    hintText: "Til",
                    maxLength: 30,
                  ),
                ),
                10.getW(),
                IconButton(
                  style: IconButton.styleFrom(
                      foregroundColor: CupertinoColors.systemOrange,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.he, horizontal: 15.he),
                      backgroundColor: CupertinoColors.systemOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                  onPressed: () {
                    setState(() {
                      if (langCtrl.text.isNotEmpty &&
                          langCtrl.text.trim().isNotEmpty) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return StatefulBuilder(
                                  builder: (ctx, setStateModal) {
                                return AlertDialog.adaptive(
                                  actions: [
                                    CupertinoButton(
                                        child: Text(
                                          "cancel".tr(),
                                          style: const TextStyle(
                                              color: CupertinoColors.activeBlue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                        }),
                                    CupertinoButton(
                                        child: Text(
                                          "add".tr(),
                                          style: const TextStyle(
                                              color: CupertinoColors.activeBlue,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onPressed: () {
                                          languages.add(LanguageModel(
                                              langName: langCtrl.text,
                                              level: sliderValue.toDouble()));
                                          setState(() {});
                                          Navigator.pop(ctx);
                                          langCtrl.clear();
                                        }),
                                  ],
                                  title: Text(
                                    "${langCtrl.text}:".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        letterSpacing: 1),
                                  ),
                                  content: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CupertinoSlider(
                                              min: 0.2,
                                              max: 1,
                                              value: sliderValue,
                                              onChanged: (v) {
                                                setStateModal(() {
                                                  sliderValue = v;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0.w),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "2/10",
                                              style: TextStyle(
                                                  color: CupertinoColors
                                                      .destructiveRed),
                                            ),
                                            Text(
                                              "6/10",
                                              style: TextStyle(
                                                  color: CupertinoColors
                                                      .activeOrange),
                                            ),
                                            Text(
                                              "10/10",
                                              style: TextStyle(
                                                  color: CupertinoColors
                                                      .activeGreen),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                            });
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
