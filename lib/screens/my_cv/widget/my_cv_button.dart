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
    required this.subTitles,
  });

  final String title;
  final VoidCallback onTab;
  final EdgeInsets? margin;
  final List<String> subTitles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: margin ?? EdgeInsets.symmetric(vertical: 8.he),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 13.he, horizontal: 10.we),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                color: AppColors.c2A3256,
                width: 1.we,
              ),
            ),
          ),
          onPressed: onTab,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.seoulRobotoMedium.copyWith(
                    color: AppColors.c2A3256,
                    fontSize: 17.sp,
                  ),
                ),
                6.getH(),
                Wrap(
                  spacing: 10.we,
                  children: List.generate(
                    subTitles.length,
                    (index) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            subTitles[index],
                            style: AppTextStyle.seoulRobotoRegular.copyWith(
                              color: AppColors.c010A27,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
