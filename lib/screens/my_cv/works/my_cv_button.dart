import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCvButton extends StatelessWidget {
  const MyCvButton({
    super.key,
    required this.title,
    required this.onTab,
    this.margin,
  });

  final String title;
  final VoidCallback onTab;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: margin ?? EdgeInsets.symmetric(vertical: 8.he),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 13.he),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                color: AppColors.c2A3256,
                width: 1.we,
              ),
            ),
          ),
          onPressed: onTab,
          child: Text(
            title,
            style: AppTextStyle.seoulRobotoMedium.copyWith(
              color: AppColors.c2A3256,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}
