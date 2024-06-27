import 'package:cv_app/screens/my_cv/certificates/certificate_input_screen.dart';
import 'package:cv_app/screens/my_cv/education/education_input_screen.dart';
import 'package:cv_app/screens/my_cv/interest/interest_input_screen.dart';
import 'package:cv_app/screens/my_cv/language/language_input_screen.dart';
import 'package:cv_app/screens/my_cv/main_input/main_input_screen.dart';
import 'package:cv_app/screens/my_cv/profile/profile_input_screen.dart';
import 'package:cv_app/screens/my_cv/projects/project_input_screen.dart';
import 'package:cv_app/screens/my_cv/skill/skill_inout_screen.dart';
import 'package:cv_app/screens/my_cv/soft_skills/soft_skill_input_screen.dart';
import 'package:cv_app/screens/my_cv/works/my_cv_button.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16.we, vertical: 16.he),
        child: Column(
          children: [
            MyCvButton(
              title: 'Personal details',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MainInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Links',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfileInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Professional Experience',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WorkScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Education',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const EducationInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Skill',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SkillInoutScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Soft Skill',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SoftSkillInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Language',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LanguageInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Project',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProjectInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Certificate',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CertificateInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Interest',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const InterestInputScreen();
                    },
                  ),
                );
              },
            ),
            MyCvButton(
              title: 'Location',
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const InterestInputScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
