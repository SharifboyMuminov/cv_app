import 'package:cv_app/bloc/auth/auth_bloc.dart';
import 'package:cv_app/bloc/auth/auth_event.dart';
import 'package:cv_app/bloc/auth/auth_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/screens/auth/verification/widget/password_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _listenPinController();
    super.initState();
  }

  _listenPinController() {
    _pinController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return PopScope(
          canPop: (state.fromStatus != FromStatus.loading),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Kodni kiriting",
                style: AppTextStyle.seoulRobotoRegular.copyWith(
                  color: AppColors.c010A27,
                  fontSize: 20.sp,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  if (state.fromStatus != FromStatus.loading) {
                    Navigator.pop(context);
                  }
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
                    padding: EdgeInsets.symmetric(horizontal: 20.we),
                    child: Column(
                      children: [
                        4.getH(),
                        Text(
                          "Elektron pochtangizni tasdiqlash uchun biz unga kod yubordik",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.seoulRobotoRegular.copyWith(
                            color: AppColors.c010A27.withOpacity(0.40),
                            fontSize: 16.sp,
                          ),
                        ),
                        20.getH(),
                        PasswordMyInput(
                          pinController: _pinController,
                          focusNode: _focusNode,
                        ),
                      ],
                    ),
                  ),
                ),
                GlobalMyButton(
                  backgroundColor:
                      _pinController.text.length == 6 ? null : Colors.grey,
                  loading: state.fromStatus == FromStatus.loading,
                  onTab: _pinController.text.length == 6
                      ? () {
                          // debugPrint("Email: ${widget.email}");
                          // debugPrint("PinCode: ${_pinController.text}");
                          context.read<AuthBloc>().add(
                                AuthVerifyEvent(
                                  activateCode: _pinController.text,
                                ),
                              );
                        }
                      : null,
                  title: "Davom etish",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
