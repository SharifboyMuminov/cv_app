import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PasswordMyInput extends StatelessWidget {
  const PasswordMyInput(
      {super.key, required this.pinController, required this.focusNode});

  final TextEditingController pinController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.symmetric(horizontal: 4.we),
      width: 36.we,
      height: 58.he,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
    );

    return Pinput(
      length: 6,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      defaultPinTheme: defaultPinTheme,
      controller: pinController,
      focusNode: focusNode,
      cursor: Container(
        height: 20.he,
        width: 2.we,
        decoration: BoxDecoration(
          color: AppColors.cF07448,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: AppColors.cF07448,
            width: 1.we,
          ),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: AppColors.c010A27.withOpacity(0.40),
            width: 1.we,
          ),
        ),
      ),
      onCompleted: (pin) {},
    );
  }
}
