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

class ForgetPasswordCodeScreen extends StatefulWidget {
  const ForgetPasswordCodeScreen({super.key, required this.email});

  final String email;

  @override
  State<ForgetPasswordCodeScreen> createState() =>
      _ForgetPasswordCodeScreenState();
}

class _ForgetPasswordCodeScreenState extends State<ForgetPasswordCodeScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerActiveCode = TextEditingController();
  String? errorTextActiveCode;
  String? errorTextEmail;

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
                          "Elektron pochtangizni kelgan kodni va yangi parolni kiriting",
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
                          errorText: errorTextActiveCode,
                          maxLength: 6,
                          textInputType: TextInputType.number,
                          digitsOnly: true,
                          textInputAction: TextInputAction.done,
                          textEditingController: controllerActiveCode,
                          hintText: "The code you received",
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
                                AuthForgetPasswordCodeEvent(
                                  email: controllerEmail.text,
                                  activeCode: controllerActiveCode.text,
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
        controllerActiveCode.text.length == 6;
  }

  _listenControllers() {
    controllerEmail.addListener(() {
      if (controllerEmail.text.isEmpty) {
        setState(() {
          errorTextEmail = 'Email is required';
        });
      } else if (!AppRegExp.emailRegExp.hasMatch(controllerEmail.text)) {
        setState(() {
          errorTextEmail = 'Enter a valid Email';
        });
      } else {
        setState(() {
          errorTextEmail = null;
        });
      }
    });
    controllerActiveCode.addListener(() {
      if (controllerActiveCode.text.isEmpty) {
        setState(() {
          errorTextActiveCode = 'Active code is required';
        });
      } else if (controllerActiveCode.text.length < 6) {
        setState(() {
          errorTextActiveCode = 'maxLength > 5 :)';
        });
      } else {
        setState(() {
          errorTextActiveCode = null;
        });
      }
    });
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerActiveCode.dispose();
    super.dispose();
  }
}
