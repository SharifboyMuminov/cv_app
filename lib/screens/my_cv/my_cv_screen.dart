import 'package:cv_app/screens/my_cv/education/education_input_screen.dart';
import 'package:cv_app/screens/my_cv/projects/project_input_screen.dart';
import 'package:cv_app/screens/my_cv/works/work_screen.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCvScreen extends StatefulWidget {
  const MyCvScreen({super.key});

  @override
  State<MyCvScreen> createState() => _MyCvScreenState();
}

class _MyCvScreenState extends State<MyCvScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Create Cv",
          style: AppTextStyle.seoulRobotoMedium.copyWith(
            color: AppColors.c010A27,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.arrowBackSvg,
            width: 24.we,
            height: 24.we,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WorkScreen();
                    },
                  ),
                );
              },
              child: Text("Work"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProjectInputScreen();
                    },
                  ),
                );
              },
              child: Text("projects"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const EducationInputScreen();
                    },
                  ),
                );
              },
              child: Text("education"),
            ),
          ],
        ),
      ),
    );
  }
}
