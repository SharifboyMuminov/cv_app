import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(child: Image.asset("assets/images/page_second.png")),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "Your Hr is in danger of falling in love",
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
