import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageMyButton extends StatelessWidget {
  const ImageMyButton({
    super.key,
    required this.imagePath,
    required this.onTab,
    required this.isActive,
  });

  final String imagePath;
  final VoidCallback onTab;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10.we, vertical: 10.he),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
          side: BorderSide(
              color: isActive ? AppColors.cF07448 : AppColors.c010A27,
              width: 2.we),
        ),
      ),
      onPressed: onTab,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
