import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/project/project_model.dart';
import 'package:cv_app/screens/my_cv/widget/add_button.dart';
import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  List<ProjectModel> projectModels = [];
  int projectsCount = 0;

  @override
  void initState() {
    _listenControllers();
    Future.microtask(() {
      projectsCount = context.read<CvBloc>().state.projects.length;
      projectModels = [...context.read<CvBloc>().state.projects];
      setState(() {});
    });
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10.we,
                    children: List.generate(
                      projectModels.length,
                      (index) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              side: BorderSide(
                                  color: AppColors.c010A27, width: 1.we),
                            ),
                          ),
                          onPressed: () {
                            projectModels.remove(projectModels[index]);
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                projectModels[index].name,
                                style: AppTextStyle.seoulRobotoRegular.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Icon(
                                Icons.close,
                                weight: 20.we,
                                color: AppColors.c010A27,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  10.getH(),
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
                  10.getH(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyAddButton(
                      onTab: _onTabAdd,
                      active: check(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            active: projectModels.length == projectsCount,
            onTab: () {
              if (projectModels.length != projectsCount) {
                context.read<CvBloc>().add(
                      CvChangeProjectsEvent(
                        projectModels: projectModels,
                      ),
                    );
                Navigator.pop(context);
              }
            },
            title: "Save",
          ),
        ],
      ),
    );
  }

  _onTabAdd() {
    FocusScope.of(context).unfocus();

    ProjectModel projectModel = ProjectModel(
      url: controllerUrl.text,
      name: controllerProject.text,
      description: controllerDescription.text,
    );
    projectModels.add(projectModel);
    controllerDescription.clear();
    controllerProject.clear();
    controllerUrl.clear();
    setState(() {});
  }

  _listenControllers() {
    controllerProject.addListener(() => setState(() {}));
    controllerDescription.addListener(() => setState(() {}));
    controllerUrl.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerProject.text.isNotEmpty &&
        controllerDescription.text.isNotEmpty &&
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
