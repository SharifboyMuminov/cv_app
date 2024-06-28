import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/language/language_model.dart';
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

class LanguageInputScreen extends StatefulWidget {
  const LanguageInputScreen({super.key});

  @override
  State<LanguageInputScreen> createState() => _LanguageInputScreenState();
}

class _LanguageInputScreenState extends State<LanguageInputScreen> {
  final TextEditingController controllerLanguage = TextEditingController();
  final TextEditingController controllerFluency = TextEditingController();

  List<LanguageModel> languageModels = [];
  int languagesCount = 0;

  @override
  void initState() {
    _listenControllers();
    Future.microtask(() {
      languagesCount = context.read<CvBloc>().state.languages.length;
      languageModels = [...context.read<CvBloc>().state.languages];
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10.we,
                    children: List.generate(
                      languageModels.length,
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
                            languageModels.remove(languageModels[index]);
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                languageModels[index].fluency,
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
                    textEditingController: controllerLanguage,
                    hintText: "Enter language",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerFluency,
                    hintText: "Enter fluency",
                  ),
                  10.getH(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyAddButton(
                      onTab: () {
                        FocusScope.of(context).unfocus();

                        LanguageModel languageModel = LanguageModel(
                          fluency: controllerFluency.text,
                          language: controllerLanguage.text,
                        );
                        languageModels.add(languageModel);
                        controllerFluency.clear();
                        controllerLanguage.clear();
                        setState(() {});
                      },
                      active: check(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            active: languagesCount == languageModels.length,
            onTab: () {
              if (languageModels.length != languagesCount) {
                context.read<CvBloc>().add(
                      CvChangeLanguageEvent(
                        languageModels: languageModels,
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
    controllerLanguage.addListener(() => setState(() {}));
    controllerFluency.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerLanguage.text.isNotEmpty &&
        controllerFluency.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerLanguage.dispose();
    controllerFluency.dispose();
    super.dispose();
  }
}
