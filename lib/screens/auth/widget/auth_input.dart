import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthMyInput extends StatelessWidget {
  const AuthMyInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.textInputType,
    this.textInputAction,
    this.obscureText,
    this.onTabEye,
    this.isPasswordInput,
    this.errorText,
    this.maxLength,
    this.digitsOnly = false,
    this.isCounterShow,
     this.changed,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final bool? isPasswordInput;
  final bool? obscureText;
  final bool digitsOnly;
  final VoidCallback? onTabEye;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final int? maxLength;
  final bool? isCounterShow;
  final ValueChanged<String>? changed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      cursorColor: CupertinoColors.activeOrange,
      inputFormatters: digitsOnly
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      controller: textEditingController,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.text,
      style: AppTextStyle.seoulRobotoSemiBold.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500

      ),
      onChanged: changed,
      decoration: InputDecoration(
        counterText: isCounterShow!=null?null:"",
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.we, vertical: 15.he),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.cF07448,
            width: 3.we,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.c010A27.withOpacity(0.40),
            width: 1.we,
          ),
        ),
        labelText: hintText,
        labelStyle: AppTextStyle.seoulRobotoRegular.copyWith(
          color: errorText != null
              ? Colors.red
              : AppColors.c010A27.withOpacity(0.60),
          fontSize: 16.sp,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.we,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.we,
          ),
        ),
        errorText: errorText,
        suffixIcon: isPasswordInput != null
            ? IconButton(
                onPressed: onTabEye,
                icon: SvgPicture.asset(
                  isPasswordInput!
                      ? AppImages.openEyeSvg
                      : AppImages.closeEyeSvg,
                  width: 24.we,
                  height: 24.we,
                ),
              )
            : null,
      ),
    );
  }
}
