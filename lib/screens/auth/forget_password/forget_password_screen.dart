import 'package:cv_app/bloc/auth/auth_bloc.dart';
import 'package:cv_app/bloc/auth/auth_event.dart';
import 'package:cv_app/bloc/auth/auth_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/screens/auth/widget/auth_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_reg_exp.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController controllerEmail = TextEditingController();

  String? errorTextForEmail;

  @override
  void initState() {
    _listenControllerEmail();
    super.initState();
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
                "Parolni tiklash",
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
                    padding: EdgeInsets.symmetric(horizontal: 20.we),
                    child: Column(
                      children: [
                        4.getH(),
                        Text(
                          "Elektron pochtangizni kiriting va biz unga parolni tiklash uchun kod yuboramiz",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.seoulRobotoRegular.copyWith(
                            color: AppColors.c010A27.withOpacity(0.40),
                            fontSize: 16.sp,
                          ),
                        ),
                        20.getH(),
                        AuthMyInput(
                          textInputAction: TextInputAction.done,
                          textEditingController: controllerEmail,
                          hintText: "Elektron pochta",
                          errorText: errorTextForEmail,
                        ),
                      ],
                    ),
                  ),
                ),
                GlobalMyButton(
                  loading: state.fromStatus == FromStatus.loading,
                  backgroundColor: _checkEmail ? null : Colors.grey,
                  onTab: _checkEmail
                      ? () {
                          context.read<AuthBloc>().add(
                                AuthResetPasswordEvent(
                                  email: controllerEmail.text,
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

  bool get _checkEmail {
    return AppRegExp.emailRegExp.hasMatch(controllerEmail.text);
  }

  _listenControllerEmail() {
    controllerEmail.addListener(() {
      if (controllerEmail.text.isEmpty) {
        setState(() {
          errorTextForEmail = 'Email is required';
        });
      } else if (!_checkEmail) {
        setState(() {
          errorTextForEmail = 'Enter a valid email address';
        });
      } else {
        setState(() {
          errorTextForEmail = null;
        });
      }
    });
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }
}
