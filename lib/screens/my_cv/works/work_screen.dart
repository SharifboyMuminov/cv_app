import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/work/work_model.dart';
import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/my_cv/widget/add_button.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  List<WorkModel> workExperience = [];
  int workExperienceCount = 0;

  @override
  void initState() {
    Future.microtask(() {
      workExperienceCount = context.read<CvBloc>().state.workModels.length;
      workExperience = [...context.read<CvBloc>().state.workModels];
      setState(() {
        
      });
    });
    _listenControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Professional Experience",
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
                      workExperience.length,
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
                            workExperience.remove(workExperience[index]);
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                workExperience[index].company,
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
                    textEditingController: controllerStartDate,
                    hintText: 'startDate',
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerLocation,
                    hintText: 'location',
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    isMaxLines: true,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerSummary,
                    hintText: 'summary',
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
            active: workExperience.length == workExperienceCount,
            onTab: () {
              if (workExperience.length != workExperienceCount) {
                context
                    .read<CvBloc>()
                    .add(CvChangeWorkEvent(workModel: workExperience));
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

    WorkModel workModel = WorkModel(
      position: controllerPosition.text,
      company: controllerCompany.text,
      location: controllerLocation.text,
      startDate: controllerStartDate.text,
      summary: controllerSummary.text,
    );

    workExperience.add(workModel);
    controllerPosition.clear();
    controllerCompany.clear();
    controllerLocation.clear();
    controllerStartDate.clear();
    controllerSummary.clear();
    setState(() {});
  }

  _listenControllers() {
    controllerPosition.addListener(() => setState(() {}));
    controllerCompany.addListener(() => setState(() {}));
    controllerSummary.addListener(() => setState(() {}));
    controllerLocation.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerPosition.text.isNotEmpty &&
        controllerCompany.text.isNotEmpty &&
        controllerSummary.text.isNotEmpty &&
        controllerLocation.text.isNotEmpty;
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
