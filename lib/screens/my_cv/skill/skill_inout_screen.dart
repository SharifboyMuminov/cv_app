import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillInoutScreen extends StatefulWidget {
  const SkillInoutScreen({super.key});

  @override
  State<SkillInoutScreen> createState() => _SkillInoutScreenState();
}

class _SkillInoutScreenState extends State<SkillInoutScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerKeywords = TextEditingController();
  final TextEditingController controllerLevel = TextEditingController();

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
          "Skill",
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
                    textEditingController: controllerName,
                    hintText: "Enter skill name",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerLevel,
                    hintText: "Enter  level",
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
                    textEditingController: controllerKeywords,
                    hintText: "Enter keywords",
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

  _listenControllers() {
    controllerKeywords.addListener(() => setState(() {}));
    controllerName.addListener(() => setState(() {}));
    controllerLevel.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerName.text.isNotEmpty ||
        controllerKeywords.text.isNotEmpty ||
        controllerLevel.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerKeywords.dispose();
    controllerLevel.dispose();
    super.dispose();
  }
}
