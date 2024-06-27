import 'dart:ui';
import 'package:cv_app/bloc/user/user_bloc.dart';
import 'package:cv_app/bloc/user/user_state.dart';
import 'package:cv_app/screens/my_cv/my_cv_screen.dart';
import 'package:cv_app/screens/tab/profile/edit_profile.dart';
import 'package:cv_app/screens/tab/profile/generate_cv/cv_generate_screen.dart';
import 'package:cv_app/screens/tab/profile/widgets/list_tile_item.dart';
import 'package:cv_app/utils/utility_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart' as page;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.context1
  });

  final BuildContext context1;
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
      home: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Material(
              color: Colors.transparent,
              child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: CupertinoColors.systemGrey5,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      flexibleSpace: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            color: Colors.transparent,
                            child: FlexibleSpaceBar(
                              centerTitle: true,
                              title: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 62.w),
                                child: Text(
                                  state.userModel.fullName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19.sp),
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              background: Column(
                                children: [
                                  SizedBox(
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
                                            state.userModel.fullName.isNotEmpty
                                                ? state.userModel.fullName[0]
                                                : "".toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 36.sp,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
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
                        style:
                            IconButton.styleFrom(foregroundColor: Colors.white),
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.qrcode,
                          color: CupertinoColors.activeBlue,
                          size: 20.sp,
                        ),
                      ),
                      backgroundColor:
                          CupertinoColors.systemGrey5.withOpacity(.1),
                      actions: [
                        CupertinoButton(
                          child: Text(
                            "edit".tr(),
                            style: TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp),
                          ),
                          onPressed: () {
                            setState(() {});
                            Navigator.push(
                              context,
                              page.PageTransition(
                                type: page.PageTransitionType.fade,
                                child: EditProfile(
                                  userModel: state.userModel,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    SliverList.list(
                      children: [
                        Center(
                          child: Text(
                            state.userModel.phoneNum.isNotEmpty
                                ? "+998${state.userModel.phoneNum}"
                                : state.userModel.email,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
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
                                        takeAnImage(context,
                                            limit: 1, images: []);
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
                                                color: CupertinoColors
                                                    .destructiveRed,
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
                                          await context.setLocale(
                                              const Locale("uz", "UZ"));
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
                                          await context.setLocale(
                                              const Locale("en", "EN"));
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
                            voidCallback: () {
                              Navigator.push(
                                widget.context1,
                                MaterialPageRoute(
                                  builder: (cont) =>

                                      const MyCvScreen(),
                                ),
                              );

                            },
                            title: "cv_generate".tr(),
                            icon: const Icon(
                              CupertinoIcons.list_bullet_below_rectangle,
                              color: Colors.white,
                            ),
                            color: CupertinoColors.activeOrange),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
