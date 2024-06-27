import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_state.dart';
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
import 'package:cv_app/screens/my_cv/widget/my_cv_button.dart';
import 'package:cv_app/screens/my_cv/works/work_screen.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocConsumer<CvBloc, CvState>(
        builder: (BuildContext context, CvState state) {
          return SingleChildScrollView(
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
                  subTitles: const [],
                ),
                MyCvButton(
                  title: 'Location',
                  onTab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LocationInputScreen();
                        },
                      ),
                    );
                  },
                  subTitles: const [],
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
                  subTitles: state.profiles
                      .map((toElement) => toElement.network)
                      .toList(),
                ),
                MyCvButton(
                  title: 'Professional Experiences',
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
                  subTitles: state.workModels
                      .map((toElement) => toElement.company)
                      .toList(),
                ),
                MyCvButton(
                  title: 'Educations',
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
                  subTitles: state.educations
                      .map((toElement) => toElement.institution)
                      .toList(),
                ),
                MyCvButton(
                  title: 'Skills',
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
                  subTitles:
                      state.skills.map((toElement) => toElement.name).toList(),
                ),
                MyCvButton(
                  title: 'Soft Skills',
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
                  subTitles: state.softSkills
                      .map((toElement) => toElement.name)
                      .toList(),
                ),
                MyCvButton(
                  title: 'Languages',
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
                  subTitles: state.languages
                      .map((toElement) => toElement.fluency)
                      .toList(),
                ),
                MyCvButton(
                  title: 'Projects',
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
                  subTitles: state.projects
                      .map((toElement) => toElement.name)
                      .toList(),
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
                  subTitles: state.certificates
                      .map((toElement) => toElement.title)
                      .toList(),
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
                  subTitles: state.interests
                      .map((toElement) => toElement.name)
                      .toList(),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, CvState state) {},
      ),
    );
  }
}
