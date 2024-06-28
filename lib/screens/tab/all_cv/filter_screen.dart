import 'dart:ui';

import 'package:cv_app/bloc/all_cv/all_cv_bloc.dart';
import 'package:cv_app/bloc/all_cv/all_cv_event.dart';
import 'package:cv_app/data/models/fliter/filter_model.dart';
import 'package:cv_app/screens/tab/all_cv/widget/range_slider.dart';
import 'package:cv_app/screens/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as met;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TextEditingController controllerJobTitle = TextEditingController();

  String _selectedItem = "offline";
  RangeValues rangeValues = const RangeValues(100, 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: met.Size(
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.we, vertical: 16.he),
              child: Column(
                children: [
                  CvMyInput(
                    textEditingController: controllerJobTitle,
                    hintText: 'Enter job title',
                  ),
                  10.getH(),
                  MyRangeSlider(
                    onChang: (RangeValues value) {},
                  ),
                  10.getH(),
                  Row(
                    children: [
                      Text(
                        "Job location",
                        style: AppTextStyle.seoulRobotoMedium.copyWith(
                          color: AppColors.c010A27,
                          fontSize: 17.sp,
                        ),
                      ),
                      10.getW(),
                      Expanded(
                        child: DropdownButton<String>(
                          value: _selectedItem,
                          items: [
                            DropdownMenuItem<String>(
                              value: 'offline',
                              child: Text(
                                'offline',
                                style: AppTextStyle.seoulRobotoRegular.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'online',
                              child: Text(
                                'online',
                                style: AppTextStyle.seoulRobotoRegular.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 20.we,
                            color: AppColors.c010A27,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: AppTextStyle.seoulRobotoRegular.copyWith(
                            color: AppColors.c010A27,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
              onTab: () {
                context.read<AllCvBloc>().add(
                      AllCvFilterEvent(
                        filterModel: FilterModel(
                          jobLocation: _selectedItem,
                          jobTitle: controllerJobTitle.text,
                          salaryEnd: rangeValues.end.toInt(),
                          salaryStart: rangeValues.start.toInt(),
                        ),
                      ),
                    );
                Navigator.pop(context);
              },
              title: "Save"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controllerJobTitle.dispose();
    super.dispose();
  }
}
