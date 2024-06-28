import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAddButton extends StatelessWidget {
  const MyAddButton({
    super.key,
    required this.onTab,
    this.title = "Add",
    required this.active,
  });

  final VoidCallback onTab;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 13.he),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: active ? AppColors.cF07448 : Colors.grey,
      ),
      onPressed: active ? onTab : null,
      child: Text(
        "Add",
        style: AppTextStyle.seoulRobotoSemiBold.copyWith(
          fontSize: 16.sp,
          letterSpacing: 1,
          color: AppColors.white,
        ),
      ),
    );
  }
}
