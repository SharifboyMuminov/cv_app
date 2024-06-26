import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  final TextEditingController controllerPosition = TextEditingController();
  final TextEditingController controllerCompany = TextEditingController();
  final TextEditingController controllerSummary = TextEditingController();
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerStartDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Work experience",
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
                children: [
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerPosition,
                    hintText: 'position',
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerCompany,
                    hintText: 'company',
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerCompany,
                    hintText: 'startDate',
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerStartDate,
                    hintText: 'location',
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    isMaxLines: true,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerSummary,
                    hintText: 'summary',
                  ),

                ],
              ),
            ),
          ),
          GlobalMyButton(
            onTab: () {},
            title: "Save",
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controllerPosition.dispose();
    controllerCompany.dispose();
    controllerSummary.dispose();
    controllerLocation.dispose();
    super.dispose();
  }
}
