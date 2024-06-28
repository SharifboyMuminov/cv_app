import 'dart:ui';
import 'package:cv_app/bloc/all_cv/all_cv_bloc.dart';
import 'package:cv_app/bloc/all_cv/all_cv_state.dart';
import 'package:cv_app/bloc/download_cv/download_cv_bloc.dart';
import 'package:cv_app/bloc/download_cv/download_cv_event.dart';
import 'package:cv_app/bloc/download_cv/download_cv_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              preferredSize: Size(
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
            title: Text("all_cvs".tr()),
          ),
          body: downloadCvState.fromStatus == FromStatus.loading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    BlocBuilder<AllCvBloc, AllCvState>(
                      builder: (BuildContext context, AllCvState state) {
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
                                        color:
                                            AppColors.c010A27.withOpacity(0.5),
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
                      },
                    ),
                  ],
                ),
        );
      },
      listener: (BuildContext context, DownloadCvState downloadCvListenState) {
        if (downloadCvListenState.fromStatus == FromStatus.success) {
          OpenFilex.open(downloadCvListenState.fileStatusModel.newFileLocation);
        }
      },
    );
  }
}
