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

class ForgetNewPasswordScreen extends StatefulWidget {
  const ForgetNewPasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<ForgetNewPasswordScreen> createState() =>
      _ForgetNewPasswordScreenState();
}

class _ForgetNewPasswordScreenState extends State<ForgetNewPasswordScreen> {
  final TextEditingController controllerNewPassword = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  String? errorTextNewPassword;
  String? errorTextEmail;

  bool obscureText = true;

  @override
  void initState() {
    controllerEmail.text = widget.email;
    _listenControllers();
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
                "Yangi parol",
                style: AppTextStyle.seoulRobotoRegular.copyWith(
                  color: AppColors.c010A27,
                  fontSize: 20.sp,
                ),
              ),
              leading: IconButton(
                onPressed: () {},
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
                          "Elektron pochtangizni va yangi parolni kiriting",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.seoulRobotoRegular.copyWith(
                            color: AppColors.c010A27.withOpacity(0.40),
                            fontSize: 16.sp,
                          ),
                        ),
                        20.getH(),
                        AuthMyInput(
                          errorText: errorTextEmail,
                          textEditingController: controllerEmail,
                          hintText: "email",
                        ),
                        12.getH(),
                        AuthMyInput(
                          errorText: errorTextNewPassword,
                          textInputAction: TextInputAction.done,
                          textEditingController: controllerNewPassword,
                          hintText: 'Parol',
                          isPasswordInput: obscureText,
                          obscureText: obscureText,
                          onTabEye: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                GlobalMyButton(
                  loading: state.fromStatus == FromStatus.loading,
                  backgroundColor: _checkInput ? null : Colors.grey,
                  onTab: _checkInput
                      ? () {
                          context.read<AuthBloc>().add(
                                AuthForgetSetPasswordEvent(
                                  email: controllerEmail.text,
                                  newPassword: controllerNewPassword.text,
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

  bool get _checkInput {
    return AppRegExp.emailRegExp.hasMatch(controllerEmail.text) &&
        AppRegExp.passwordRegExp.hasMatch(controllerNewPassword.text);
  }

  _listenControllers() {
    controllerNewPassword.addListener(() {
      if (controllerNewPassword.text.isEmpty) {
        setState(() {
          errorTextNewPassword = 'Password is required';
        });
      } else if (!AppRegExp.passwordRegExp
          .hasMatch(controllerNewPassword.text)) {
        setState(() {
          errorTextNewPassword = 'Enter a valid password';
        });
      } else {
        setState(() {
          errorTextNewPassword = null;
        });
      }
    });
    controllerEmail.addListener(() {
      if (controllerEmail.text.isEmpty) {
        setState(() {
          errorTextEmail = 'Email is required';
        });
      } else if (!AppRegExp.passwordRegExp.hasMatch(controllerEmail.text)) {
        setState(() {
          errorTextEmail = 'Enter a valid email';
        });
      } else {
        setState(() {
          errorTextEmail = null;
        });
      }
    });
  }

  @override
  void dispose() {
    controllerNewPassword.dispose();
    controllerEmail.dispose();
    super.dispose();
  }
}
