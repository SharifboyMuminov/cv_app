import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/soft_skill/soft_skill_model.dart';
import 'package:cv_app/screens/my_cv/widget/add_button.dart';
import 'package:cv_app/screens/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoftSkillInputScreen extends StatefulWidget {
  const SoftSkillInputScreen({super.key});

  @override
  State<SoftSkillInputScreen> createState() => _SoftSkillInputScreenState();
}

class _SoftSkillInputScreenState extends State<SoftSkillInputScreen> {
  final TextEditingController controllerName = TextEditingController();

  List<SoftSkillModel> softSkillModels = [];
  int softSkillsCount = 0;

  @override
  void initState() {
    _listenControllers();
    Future.microtask(() {
      softSkillsCount = context.read<CvBloc>().state.softSkills.length;
      softSkillModels = [...context.read<CvBloc>().state.softSkills];
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
          "Soft skill",
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
                      softSkillModels.length,
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
                            softSkillModels.remove(softSkillModels[index]);
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                softSkillModels[index].name,
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
                    textEditingController: controllerName,
                    hintText: "Enter soft skill name",
                  ),
                  10.getH(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyAddButton(
                      onTab: () {
                        FocusScope.of(context).unfocus();

                        softSkillModels
                            .add(SoftSkillModel(name: controllerName.text));
                        controllerName.clear();
                      },
                      active: check(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            active: softSkillModels.length == softSkillsCount,
            onTab: () {
              if (softSkillModels.length != softSkillsCount) {
                context.read<CvBloc>().add(
                      CvChangeSoftSkillEvent(
                        softSkillModels: softSkillModels,
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

  _listenControllers() {
    controllerName.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerName.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }
}
