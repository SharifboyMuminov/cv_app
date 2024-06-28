import 'dart:io';
import 'package:cv_app/bloc/auth/auth_bloc.dart';
import 'package:cv_app/bloc/auth/auth_event.dart';
import 'package:cv_app/bloc/auth/auth_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/screens/auth/dialog/my_show_dialog.dart';
import 'package:cv_app/screens/auth/forget_new_password/forget_new_password_screen.dart';
import 'package:cv_app/screens/auth/forget_password_code/forget_password_code_screen.dart';
import 'package:cv_app/screens/auth/log_in/log_in_screen.dart';
import 'package:cv_app/screens/auth/verification/verification_screen.dart';
import 'package:cv_app/screens/auth/widget/auth_input.dart';
import 'package:cv_app/screens/tab/tab_screen.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_reg_exp.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controllerFullName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  bool obscureText = true;

  String? errorTextForName;
  String? errorTextForEmail;
  String? errorTextForPassword;

  @override
  void initState() {
    _listenTextController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness:
                Platform.isIOS ? Brightness.light : Brightness.dark),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: mat.Size(
            MediaQuery.sizeOf(context).width,
            0.4.h,
          ),
          child: Container(
            height: 0.4.h,
            width: double.infinity,
            color: CupertinoColors.systemGrey,
          ),
        ),
        title: Text(
          "Register",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            color: AppColors.c010A27,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.we, vertical: 16.he),
                  child: Column(
                    children: [
                      40.getH(),
                      AuthMyInput(
                        textEditingController: controllerFullName,
                        hintText: 'Full name',
                        errorText: errorTextForName,
                      ),
                      12.getH(),
                      AuthMyInput(
                        textInputType: TextInputType.emailAddress,
                        textEditingController: controllerEmail,
                        hintText: 'Email address',
                        errorText: errorTextForEmail,
                      ),
                      12.getH(),
                      AuthMyInput(
                        textInputAction: TextInputAction.done,
                        textEditingController: controllerPassword,
                        hintText: 'Password',
                        isPasswordInput: obscureText,
                        obscureText: obscureText,
                        onTabEye: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        errorText: errorTextForPassword,
                      ),
                      20.getH(),
                      GlobalMyButton(
                        loading: state.fromStatus == FromStatus.loading,
                        backgroundColor: _validationInput ? null : Colors.grey,
                        margin: EdgeInsets.zero,
                        onTab: _validationInput
                            ? () {
                                FocusScope.of(context).unfocus();
                                context.read<AuthBloc>().add(
                                      AuthRegisterEvent(
                                        email: controllerEmail.text,
                                        fullName: controllerFullName.text,
                                        password: controllerPassword.text,
                                      ),
                                    );
                              }
                            : null,
                        title: "REGISTER",
                      ),
                      20.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do you have an account?",
                            style: AppTextStyle.seoulRobotoRegular.copyWith(
                              color: AppColors.c010A27,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            onPressed: () {
                              if (state.fromStatus != FromStatus.loading) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const LoginInScreen();
                                    },
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Login",
                              style: AppTextStyle.seoulRobotoRegular.copyWith(
                                color: AppColors.cF07448,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 30.he,
                  left: 20.we,
                  right: 20.we,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  "By registering, you accept the terms of processing of personal data and use of the application.",
                  style: AppTextStyle.seoulRobotoRegular.copyWith(
                      color: AppColors.c010A27.withOpacity(0.40),
                      fontSize: 14.sp),
                ),
              ),
            ],
          );
        },
        listener: _listenAuthBloc,
      ),
    );
  }

  bool get _validationInput {
    return (AppRegExp.passwordRegExp.hasMatch(controllerPassword.text) &&
            AppRegExp.emailRegExp.hasMatch(controllerEmail.text)) &&
        controllerFullName.text.isNotEmpty;
  }

  _listenAuthBloc(BuildContext context, AuthState state) {
    if (state.fromStatus == FromStatus.authenticated) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const TabScreen();
        },
      ), (route) => false);
    } else if (state.fromStatus == FromStatus.success) {
      if (state.statusMessage == "_register") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const VerificationScreen();
            },
          ),
        );
      } else if (state.statusMessage == "_resetPassword") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ForgetPasswordCodeScreen(email: state.userEmail);
            },
          ),
        );
      } else if (state.statusMessage == "_forgetPasswordCode") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ForgetNewPasswordScreen(email: state.userEmail);
            },
          ),
        );
      }
    } else if (state.fromStatus == FromStatus.error) {
      myShowDialog(
        context,
        title: state.errorText,
        onTab: () {
          Navigator.pop(context);
        },
      );
    }
  }

  _listenTextController() {
    controllerFullName.addListener(() {
      setState(() {});
    });
    controllerEmail.addListener(() {
      if (controllerEmail.text.isEmpty) {
        setState(() {
          errorTextForEmail = 'Email is required';
        });
      } else if (!AppRegExp.emailRegExp.hasMatch(controllerEmail.text)) {
        setState(() {
          errorTextForEmail = 'Enter a valid email address';
        });
      } else {
        setState(() {
          errorTextForEmail = null;
        });
      }
    });
    controllerPassword.addListener(() {
      if (controllerPassword.text.isEmpty) {
        setState(() {
          errorTextForPassword = 'Password is required';
        });
      } else if (!AppRegExp.passwordRegExp.hasMatch(controllerPassword.text)) {
        setState(() {
          errorTextForPassword = 'Enter a valid password';
        });
      } else {
        setState(() {
          errorTextForPassword = null;
        });
      }
    });
  }

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerEmail.dispose();
    controllerFullName.dispose();
    super.dispose();
  }
}
