import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogButtons extends StatelessWidget {
  const DialogButtons({
    super.key,
    required this.onTab,
    required this.iconData,
    required this.title,
  });

  final VoidCallback onTab;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: TextButton(
        style: TextButton.styleFrom(
          side: BorderSide(color: AppColors.c2A3256, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onTab,
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40.sp,
              color: AppColors.c2A3256,
            ),
            SizedBox(width: 20.w),
            Text(
              title,
              style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                color: AppColors.c4B4B4B,
                fontSize: 17.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
