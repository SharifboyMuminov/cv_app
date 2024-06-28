import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({super.key, required this.onChang});

  final ValueChanged<RangeValues> onChang;

  @override
  State<MyRangeSlider> createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<MyRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(1000.0, 3000.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.he),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFDEE1E7),
            width: 1.we,
          ),
        ),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsetsDirectional.symmetric(vertical: 20.he),
        tilePadding: EdgeInsetsDirectional.zero,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColors.transparent),
        ),
        initiallyExpanded: true,
        title: Text(
          "Salary",
          style: AppTextStyle.seoulRobotoMedium.copyWith(
            color: AppColors.c010A27,
            fontSize: 16.sp,
          ),
        ),
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2.he,
            ),
            child: RangeSlider(
              activeColor: AppColors.cFF9228,
              inactiveColor: const Color(0xFFCCC4C2),
              values: _currentRangeValues,
              min: 0,
              max: 10000,
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                  widget.onChang.call(values);
                  _onRangeChanged(values.start, values.end);
                });
              },
              onChangeStart: (RangeValues values) {
                _onStartTracking(true);
              },
              onChangeEnd: (RangeValues values) {
                _onStopTracking(true);
              },
              labels: RangeLabels(
                '\$${_currentRangeValues.start.round()}',
                '\$${_currentRangeValues.end.round()}',
              ),
              divisions: 400,
            ),
          ),
        ],
      ),
    );
  }

  void _onRangeChanged(double lowerValue, double upperValue) {}

  void _onStartTracking(bool isStart) {}

  void _onStopTracking(bool isStart) {}
}
