import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageInputScreen extends StatefulWidget {
  const LanguageInputScreen({super.key});

  @override
  State<LanguageInputScreen> createState() => _LanguageInputScreenState();
}

class _LanguageInputScreenState extends State<LanguageInputScreen> {
  final TextEditingController controllerLanguage = TextEditingController();
  final TextEditingController controllerFluency = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Language",
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
                    textEditingController: controllerLanguage,
                    hintText: "Enter language",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerFluency,
                    hintText: "Enter fluency",
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
    controllerLanguage.dispose();
    controllerFluency.dispose();
    super.dispose();
  }
}
