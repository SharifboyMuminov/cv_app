import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/certificate/certificate_model.dart';
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

class CertificateInputScreen extends StatefulWidget {
  const CertificateInputScreen({super.key});

  @override
  State<CertificateInputScreen> createState() => _CertificateInputScreenState();
}

class _CertificateInputScreenState extends State<CertificateInputScreen> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerIssuer = TextEditingController();

  List<CertificateModel> certificatesModes = [];
  int certificatesCount = 0;

  @override
  void initState() {
    _listenControllers();
    Future.microtask(() {
      certificatesCount = context.read<CvBloc>().state.certificates.length;
      certificatesModes = [...context.read<CvBloc>().state.certificates];
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10.we,
                    children: List.generate(
                      certificatesModes.length,
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
                            certificatesModes.remove(certificatesModes[index]);
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                certificatesModes[index].title,
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
                    textEditingController: controllerTitle,
                    hintText: "Enter title",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerIssuer,
                    hintText: "Enter issuer",
                  ),
                  10.getH(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyAddButton(
                      onTab: () {
                        FocusScope.of(context).unfocus();

                        CertificateModel certificateModel = CertificateModel(
                          title: controllerTitle.text,
                          issuer: controllerIssuer.text,
                        );

                        certificatesModes.add(certificateModel);
                        controllerTitle.clear();
                        controllerIssuer.clear();
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
            active: certificatesModes.length == certificatesCount,
            onTab: () {
              if (certificatesModes.length != certificatesCount) {
                context.read<CvBloc>().add(
                      CvChangeCertificateEvent(
                        certificatesModels: certificatesModes,
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
    controllerIssuer.addListener(() => setState(() {}));
    controllerTitle.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerTitle.text.isNotEmpty && controllerIssuer.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerIssuer.dispose();
    super.dispose();
  }
}
