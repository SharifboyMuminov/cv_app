import 'dart:ui';
import 'package:cv_app/screens/tab/profile/widgets/list_tile_item.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/utility_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: CupertinoColors.systemGrey5,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.transparent,
                      child: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          "name",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20.sp),
                        ),
                        background: Column(
                          children: [
                            20.getH(),
                            SizedBox(
                                height: 150.w,
                                width: 90.w,
                                child: GestureDetector(
                                    child: Container(
                                        width: 90.w,
                                        height: 90.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(
                                                CupertinoColors
                                                    .activeBlue.value,
                                              ).withOpacity(.6),
                                              Color(
                                                CupertinoColors
                                                    .activeBlue.value,
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "DD",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 36.sp,
                                                color: Colors.white),
                                          ),
                                        )))),
                             SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                primary: true,
                pinned: true,
                snap: true,
                stretch: true,
                expandedHeight: 130.h,
                scrolledUnderElevation: 0,
                floating: true,
                leading: IconButton(
                  style: IconButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.qrcode,
                    color: CupertinoColors.activeBlue,
                    size: 20.sp,
                  ),
                ),
                backgroundColor: CupertinoColors.systemGrey5.withOpacity(.1),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  )
                ],
              ),
              SliverList.list(
                children: [
                  Center(
                    child: Text(
                      "phone",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black.withOpacity(.4),
                      ),
                    ),
                  ),
                  ListTileItem(
                    voidCallback: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return CupertinoActionSheet(
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.activeBlue),
                              ),
                            ),
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                  takeAnImage(context, limit: 1, images: []);
                                },
                                child: const Text(
                                  "Set new image",
                                  style: TextStyle(
                                      color: CupertinoColors.activeBlue,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              20 > 20
                                  ? CupertinoActionSheetAction(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: CupertinoColors.destructiveRed,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          );
                        },
                      );
                    },
                    title: "Change Profile Photo",
                    icon: const Icon(
                      CupertinoIcons.camera,
                      color: CupertinoColors.activeBlue,
                    ),
                    color: CupertinoColors.white,
                    isPhoto: true,
                  ),
                  ListTileItem(
                      voidCallback: () {},
                      title: "my_profile".tr(),
                      icon: const Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.white,
                      ),
                      color: CupertinoColors.destructiveRed),
                  ListTileItem(
                    isSwitch: true,
                    voidCallback: () {},
                    title: "hidden_acc".tr(),
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                    color: CupertinoColors.systemOrange,
                  ),
                  ListTileItem(
                      voidCallback: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "cancel".tr(),
                                  style: TextStyle(
                                      color: CupertinoColors.activeBlue,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () async {
                                    await context
                                        .setLocale(const Locale("uz", "UZ"));
                                    if (!context.mounted) return;
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "uz".tr(),
                                    style: TextStyle(
                                        color: CupertinoColors.activeBlue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () async {
                                    await context
                                        .setLocale(const Locale("en", "EN"));
                                    if (!context.mounted) return;
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "en".tr(),
                                    style: TextStyle(
                                        color: CupertinoColors.activeBlue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      title: "language".tr(),
                      icon: const Icon(
                        Icons.language,
                        color: CupertinoColors.white,
                      ),
                      color: CupertinoColors.activeBlue),
                  ListTileItem(
                      voidCallback: () {},
                      title: "log_out".tr(),
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      color: CupertinoColors.destructiveRed),
                ],
              ),
            ],
          ),
        ));
  }
}
