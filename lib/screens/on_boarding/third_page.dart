import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(child: Image.asset("assets/images/page_third.png")),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "You're almost hired",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
