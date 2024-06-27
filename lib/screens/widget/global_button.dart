import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalMyButton extends StatelessWidget {
  const GlobalMyButton({
    super.key,
    required this.onTab,
    required this.title,
    this.margin,
    this.backgroundColor,
    this.titleColor,
    this.iconPath,
    this.padding,
    this.loading = false,
    this.active = false,
  });

  final VoidCallback? onTab;
  final String title;
  final String? iconPath;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool loading;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          margin ?? EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(vertical: 17.he),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          backgroundColor:
              active ? Colors.grey : backgroundColor ?? AppColors.cF07448,
        ),
        onPressed: loading ? null : onTab,
        child: loading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconPath != null)
                    SvgPicture.asset(
                      iconPath!,
                      width: 24.we,
                      height: 24.we,
                    ),
                  if (iconPath != null) 4.getW(),
                  Column(
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                          fontSize: 16.sp,
                          color: titleColor ?? AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
