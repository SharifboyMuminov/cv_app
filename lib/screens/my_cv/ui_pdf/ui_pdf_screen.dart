import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/screens/my_cv/ui_pdf/widget/image_button.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiPdfScreen extends StatefulWidget {
  const UiPdfScreen({super.key});

  @override
  State<UiPdfScreen> createState() => _UiPdfScreenState();
}

class _UiPdfScreenState extends State<UiPdfScreen> {
  String selectImagePath = "";
  String stylePdf = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Profilga kirish",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
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
                  ImageMyButton(
                    imagePath: AppImages.basicPng,
                    onTab: () {
                      stylePdf = "basic";
                      selectImagePath = AppImages.basicPng;
                      setState(() {});
                    },
                    isActive: selectImagePath == AppImages.basicPng,
                  ),
                  15.getH(),
                  ImageMyButton(
                    imagePath: AppImages.classicPng,
                    onTab: () {
                      stylePdf = "classic";

                      selectImagePath = AppImages.classicPng;
                      setState(() {});
                    },
                    isActive: selectImagePath == AppImages.classicPng,
                  ),
                  15.getH(),
                  ImageMyButton(
                    imagePath: AppImages.simplePng,
                    onTab: () {
                      stylePdf = "simple";

                      selectImagePath = AppImages.simplePng;
                      setState(() {});
                    },
                    isActive: selectImagePath == AppImages.simplePng,
                  ),
                  10.getH(),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            active: selectImagePath.isEmpty,
            onTab: () {
              if (selectImagePath.isNotEmpty) {
                context.read<CvBloc>().add(
                      CvChangPdfStyleEvent(
                        pdfStyleName: stylePdf,
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
}
