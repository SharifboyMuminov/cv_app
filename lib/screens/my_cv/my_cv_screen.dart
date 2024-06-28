import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/bloc/cv_bloc/cv_state.dart';
import 'package:cv_app/bloc/download_cv/download_cv_bloc.dart';
import 'package:cv_app/bloc/download_cv/download_cv_event.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
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
import 'package:cv_app/screens/my_cv/ui_pdf/ui_pdf_screen.dart';
import 'package:cv_app/screens/my_cv/widget/my_cv_button.dart';
import 'package:cv_app/screens/my_cv/works/work_screen.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: CupertinoColors.systemGrey6,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Cv",
          style: AppTextStyle.seoulRobotoMedium.copyWith(
              color: AppColors.c010A27,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: mat.Size(
            MediaQuery.sizeOf(context).width,
            0.4.h,
          ),
          child: Container(
            height: 0.4.h,
            width: double.infinity,
            color: CupertinoColors.systemGrey,
          ),
        ),
      ),
      body: BlocConsumer<CvBloc, CvState>(
        builder: (BuildContext context, CvState state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.we, vertical: 16.he),
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
                        subTitles: state.skills
                            .map((toElement) => toElement.name)
                            .toList(),
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
                ),
              ),
              GlobalMyButton(
                onTab: () {
                  if (state.metaModel.template.isEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const UiPdfScreen();
                        },
                      ),
                    );
                  } else {
                    context.read<CvBloc>().add(CvGenerateEvent());
                  }
                },
                title: "Generate",
              ),
            ],
          );
        },
        listener: (BuildContext context, CvState state) {
          if (state.fromStatus == FromStatus.success) {
            if (state.pdfUrl.isNotEmpty) {
              context.read<DownloadCvBloc>().add(
                    DownloadCvNewEvent(
                      downloadUrl: state.pdfUrl,
                    ),
                  );
              context.read<CvBloc>().add(CvInitialEvent());
            }
          }
        },
      ),
    );
  }
}
