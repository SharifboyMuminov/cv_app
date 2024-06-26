import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CertificateInputScreen extends StatefulWidget {
  const CertificateInputScreen({super.key});

  @override
  State<CertificateInputScreen> createState() => _CertificateInputScreenState();
}

class _CertificateInputScreenState extends State<CertificateInputScreen> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerIssuer = TextEditingController();

  @override
  void initState() {
    _listenControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Certificate",
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
                children: [
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerTitle,
                    hintText: "Enter title",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerIssuer,
                    hintText: "Enter issuer",
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            active: !check(),
            onTab: () {},
            title: "Save",
          ),
        ],
      ),
    );
  }

  _listenControllers() {
    controllerIssuer.addListener(() => setState(() {}));
    controllerTitle.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerTitle.text.isNotEmpty || controllerIssuer.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerIssuer.dispose();
    super.dispose();
  }
}
