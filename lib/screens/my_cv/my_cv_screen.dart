import 'package:cv_app/screens/my_cv/certificates/certificate_input_screen.dart';
import 'package:cv_app/screens/my_cv/education/education_input_screen.dart';
import 'package:cv_app/screens/my_cv/interest/interest_input_screen.dart';
import 'package:cv_app/screens/my_cv/language/language_input_screen.dart';
import 'package:cv_app/screens/my_cv/location/location_input_screen.dart';
import 'package:cv_app/screens/my_cv/main_input/main_input_screen.dart';
import 'package:cv_app/screens/my_cv/profile/profile_input_screen.dart';
import 'package:cv_app/screens/my_cv/projects/project_input_screen.dart';
import 'package:cv_app/screens/my_cv/skill/skill_inout_screen.dart';
import 'package:cv_app/screens/my_cv/soft_skills/soft_skill_input_screen.dart';
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
              child: const Text("Work"),
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
              child: const Text("projects"),
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
              child: const Text("education"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CertificateInputScreen();
                    },
                  ),
                );
              },
              child: const Text("certificates"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SkillInoutScreen();
                    },
                  ),
                );
              },
              child: const Text("skill"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SoftSkillInputScreen();
                    },
                  ),
                );
              },
              child: const Text("soft skill"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LanguageInputScreen();
                    },
                  ),
                );
              },
              child: const Text("Language"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const InterestInputScreen();
                    },
                  ),
                );
              },
              child: const Text("interests"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfileInputScreen();
                    },
                  ),
                );
              },
              child: const Text("ProfileInputScreen"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LocationInputScreen();
                    },
                  ),
                );
              },
              child: const Text("LocationInputScreen"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MainInputScreen();
                    },
                  ),
                );
              },
              child: const Text("MainInputScreen"),
            ),
          ],
        ),
      ),
    );
  }
}
