import 'dart:ui';

import 'package:cv_app/bloc/all_cv/all_cv_bloc.dart';
import 'package:cv_app/bloc/all_cv/all_cv_event.dart';
import 'package:cv_app/bloc/all_cv/all_cv_state.dart';
import 'package:cv_app/bloc/download_cv/download_cv_bloc.dart';
import 'package:cv_app/bloc/download_cv/download_cv_event.dart';
import 'package:cv_app/bloc/download_cv/download_cv_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/screens/tab/all_cv/filter_screen.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_filex/open_filex.dart';

class AllCvsScreen extends StatefulWidget {
  const AllCvsScreen({super.key});

  @override
  State<AllCvsScreen> createState() => _AllCvsScreenState();
}

class _AllCvsScreenState extends State<AllCvsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadCvBloc, DownloadCvState>(
      builder: (BuildContext context, DownloadCvState downloadCvState) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: CupertinoColors.systemGrey5,
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
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FilterScreen();
                  }));
                },
                icon: SvgPicture.asset(
                  AppImages.filterSvg,
                  width: 24.we,
                  height: 24.he,
                ),
              ),
            ],
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            backgroundColor: Colors.white.withOpacity(.7),
            title: Text("All Cv"),
          ),
          body: downloadCvState.fromStatus == FromStatus.loading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    BlocBuilder<AllCvBloc, AllCvState>(
                      builder: (BuildContext context, AllCvState state) {
                        if (state.fromStatus == FromStatus.error) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              400.getH(),
                              Text(
                                "Empty :)",
                                style: AppTextStyle.seoulRobotoMedium.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 18.sp,
                                ),
                              ),
                              GlobalMyButton(
                                  onTab: () {
                                    context
                                        .read<AllCvBloc>()
                                        .add(AllCvReturnEvent());
                                  },
                                  title: "Call All Cv"),
                            ],
                          );
                        }

                        if (state.fromStatus == FromStatus.success) {
                          if (state.currentResumes.isEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                350.getH(),
                                Text(
                                  state.errorText,
                                  style:
                                      AppTextStyle.seoulRobotoMedium.copyWith(
                                    color: AppColors.c010A27,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                GlobalMyButton(
                                    onTab: () {
                                      context
                                          .read<AllCvBloc>()
                                          .add(AllCvCallEvent());
                                    },
                                    title: "Call All Cv"),
                              ],
                            );
                          }

                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.currentResumes.length,
                              itemBuilder: (ctx, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Job title: ${state.currentResumes[index].jobTitle}",
                                        style: AppTextStyle.seoulRobotoMedium
                                            .copyWith(
                                          color: AppColors.c010A27,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Salary : ${state.currentResumes[index].salary}",
                                        style: AppTextStyle.seoulRobotoRegular
                                            .copyWith(
                                          color: AppColors.c010A27
                                              .withOpacity(0.5),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      onTap: () {
                                        context.read<DownloadCvBloc>().add(
                                              DownloadCvNewEvent(
                                                  downloadUrl: state
                                                      .currentResumes[index]
                                                      .filename),
                                            );
                                      },
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 0.55,
                                      color: Colors.black.withOpacity(.6),
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        }

                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      },
                    ),
                  ],
                ),
        );
      },
      listener: (BuildContext context, DownloadCvState downloadCvListenState) {
        if (downloadCvListenState.fromStatus == FromStatus.success) {
        }
      },
    );
  }
}
