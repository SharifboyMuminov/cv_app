import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectInputScreen extends StatefulWidget {
  const ProjectInputScreen({super.key});

  @override
  State<ProjectInputScreen> createState() => _ProjectInputScreenState();
}

class _ProjectInputScreenState extends State<ProjectInputScreen> {
  final TextEditingController controllerProject = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerUrl = TextEditingController();

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
          "Projects",
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
                    textEditingController: controllerProject,
                    hintText: "Project name",
                  ),
                  CvMyInput(
                    isMaxLines: true,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerDescription,
                    hintText: "Description",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerUrl,
                    hintText: "url",
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
    controllerProject.addListener(() => setState(() {}));
    controllerDescription.addListener(() => setState(() {}));
    controllerUrl.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerProject.text.isNotEmpty ||
        controllerDescription.text.isNotEmpty ||
        controllerUrl.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerProject.dispose();
    controllerDescription.dispose();
    controllerUrl.dispose();
    super.dispose();
  }
}
