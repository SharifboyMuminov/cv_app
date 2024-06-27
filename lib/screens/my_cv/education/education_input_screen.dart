import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EducationInputScreen extends StatefulWidget {
  const EducationInputScreen({super.key});

  @override
  State<EducationInputScreen> createState() => _EducationInputScreenState();
}

class _EducationInputScreenState extends State<EducationInputScreen> {
  final TextEditingController controllerInstitution = TextEditingController();
  final TextEditingController controllerArea = TextEditingController();
  final TextEditingController controllerStudyType = TextEditingController();
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerScore = TextEditingController();
  final TextEditingController controllerCourses = TextEditingController();

  String startDate = "start date";
  String endDate = "end date";

  @override
  void initState() {
    _listenControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Education",
          style: AppTextStyle.seoulRobotoMedium.copyWith(
            color: AppColors.c010A27,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.arrowBackSvg,
            width: 24.we,
            height: 24.we,

          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.we, vertical: 16.he),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerInstitution,
                    hintText: "Enter institution",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerArea,
                    hintText: "Enter area",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerStudyType,
                    hintText: "Enter study type",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerLocation,
                    hintText: "Enter location",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerScore,
                    hintText: "Enter score",
                  ),
                  10.getH(),
                  Text(
                    "Please separate the directions you read with commas!",
                    style: AppTextStyle.seoulRobotoMedium.copyWith(
                      color: AppColors.c010A27,
                      fontSize: 13.sp,
                    ),
                  ),
                  CvMyInput(
                    isMaxLines: true,
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 8.he),
                    textEditingController: controllerCourses,
                    hintText: "Enter courses",
                  ),
                  40.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              side: BorderSide(
                                color: AppColors.cF07448,
                                width: 1.we,
                              ),
                            ),
                          ),
                          onPressed: () {
                            _onTabDate(true);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                startDate,
                                style: AppTextStyle.seoulRobotoMedium.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Image.asset(
                                AppImages.dateIconPng,
                                width: 30.we,
                                height: 30.we,
                              ),
                            ],
                          ),
                        ),
                      ),
                      10.getW(),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              side: BorderSide(
                                color: AppColors.cF07448,
                                width: 1.we,
                              ),
                            ),
                          ),
                          onPressed: () {
                            _onTabDate();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                endDate,
                                style: AppTextStyle.seoulRobotoMedium.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Image.asset(
                                AppImages.dateIconPng,
                                width: 30.we,
                                height: 30.we,
                              ),
                            ],
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
            active: !check(),
            onTab: () {},
            title: "Save",
          ),
        ],
      ),
    );
  }

  _onTabDate([bool isStartDate = false]) async {
    DateTime? dateTime = await showDatePicker(
      initialDatePickerMode: DatePickerMode.year,
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (dateTime != null) {
      if (isStartDate) {
        if (endDate.length == 4) {
          if (dateTime.year >= int.parse(endDate)) {
            _showMySnackBar();
          } else {
            startDate = dateTime.year.toString();
            setState(() {});
          }
        } else {
          startDate = dateTime.year.toString();
          setState(() {});
        }
      } else {
        if (startDate.length == 4) {
          if (dateTime.year >= int.parse(startDate)) {
            _showMySnackBar();
          } else {
            endDate = dateTime.year.toString();
            setState(() {});
          }
        } else {
          endDate = dateTime.year.toString();
          setState(() {});
        }
      }
    }
  }

  _showMySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Invalid input",
          style: AppTextStyle.seoulRobotoMedium.copyWith(
            fontSize: 14.sp,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  _listenControllers() {
    controllerInstitution.addListener(() => setState(() {}));
    controllerArea.addListener(() => setState(() {}));
    controllerStudyType.addListener(() => setState(() {}));
    controllerLocation.addListener(() => setState(() {}));
    controllerScore.addListener(() => setState(() {}));
    controllerCourses.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerInstitution.text.isNotEmpty ||
        controllerArea.text.isNotEmpty ||
        controllerStudyType.text.isNotEmpty ||
        controllerLocation.text.isNotEmpty ||
        controllerScore.text.isNotEmpty ||
        controllerCourses.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerInstitution.dispose();
    controllerArea.dispose();
    controllerStudyType.dispose();
    controllerLocation.dispose();
    controllerScore.dispose();
    controllerCourses.dispose();

    super.dispose();
  }
}
