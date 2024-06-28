import 'dart:ui';
import 'package:cv_app/bloc/user/user_bloc.dart';
import 'package:cv_app/bloc/user/user_event.dart';
import 'package:cv_app/bloc/user/user_state.dart';
import 'package:cv_app/data/models/from_status/from_status.dart';
import 'package:cv_app/data/models/user/user_model.dart';
import 'package:cv_app/screens/auth/widget/auth_input.dart';
import 'package:cv_app/screens/tab/profile/generate_cv/widgets/salary_textfield.dart';
import 'package:cv_app/screens/widget/zoom_tap.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  @override
  void initState() {
    nameCtrl.text = widget.userModel.fullName;
    phoneCtrl.text = "+998${widget.userModel.phoneNum}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.fromStatus == FromStatus.success ? Navigator.pop(context) : null;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CupertinoColors.systemGrey5,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            bottom: PreferredSize(
              preferredSize: mat.Size(
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
            title: const Text("Edit profile"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView(
              children: [
                18.getH(),
                AuthMyInput(
                    maxLength: 30,
                    textEditingController: nameCtrl,
                    hintText: "Full name"),
                12.getH(),
                MoneyInput(
                    isNumber: 1,
                    textEditingController: phoneCtrl,
                    hintText: "Phone"),
                40.getH(),
                ScaleOnPress(
                  onTap: () async {
                    context.read<UserBloc>().add(UserUpdateEvent(
                        name: nameCtrl.text, phone: phoneCtrl.text.trim()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                        color: CupertinoColors.activeOrange,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Center(
                      child: state.fromStatus != FromStatus.loading
                          ? Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp),
                            )
                          : const CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
