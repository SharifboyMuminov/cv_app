import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCvsScreen extends StatefulWidget {
  const AllCvsScreen({super.key});

  @override
  State<AllCvsScreen> createState() => _AllCvsScreenState();
}

class _AllCvsScreenState extends State<AllCvsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CupertinoColors.systemGrey5,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.sizeOf(context).width,
            0.4.h,
          ),
          child: Container(
            height: 0.4.h,
            width: double.infinity,
            color: CupertinoColors.systemGrey,
          ),
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(.7),
        title: Text("all_cvs".tr()),
      ),
      body: Scrollbar(
        thickness: 6,
        radius: Radius.circular(24.r),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ListTile(
                  title: Text("Index - $index"),
                ),
                Container(
                  width: double.infinity,
                  height: 0.55,
                  color: Colors.black.withOpacity(.6),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
