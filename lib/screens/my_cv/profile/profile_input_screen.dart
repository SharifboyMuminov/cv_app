import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/data/my_models/profile/profiles_model.dart';
import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/my_cv/works/add_button.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileInputScreen extends StatefulWidget {
  const ProfileInputScreen({super.key});

  @override
  State<ProfileInputScreen> createState() => _ProfileInputScreenState();
}

class _ProfileInputScreenState extends State<ProfileInputScreen> {
  final TextEditingController controllerNetwork = TextEditingController();
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerUrl = TextEditingController();
  List<ProfileModel> profileLink = [];
  int countLinks = 0;

  @override
  void initState() {
    Future.microtask(() {
      profileLink = [...context.read<CvBloc>().state.profiles];
      countLinks = context.read<CvBloc>().state.profiles.length;
      setState(() {});
    });
    _listenControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Personal information Links",
          style: AppTextStyle.seoulRobotoMedium.copyWith(
            color: AppColors.c010A27,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.arrowBackSvg,
            width: 24.we,
            height: 24.we,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.we, vertical: 16.he),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10.we,
                    children: List.generate(
                      profileLink.length,
                      (index) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              side: BorderSide(
                                  color: AppColors.c010A27, width: 1.we),
                            ),
                          ),
                          onPressed: () {
                            profileLink.remove(profileLink[index]);
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                profileLink[index].network,
                                style: AppTextStyle.seoulRobotoRegular.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Icon(
                                Icons.close,
                                weight: 20.we,
                                color: AppColors.c010A27,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  15.getH(),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerNetwork,
                    hintText: "Enter network",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerUsername,
                    hintText: "Enter username",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerUrl,
                    hintText: "url",
                  ),
                  10.getH(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyAddButton(
                      onTab: _onTabAdd,
                      active: check(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            active: countLinks == profileLink.length,
            onTab: () {},
            title: "Save",
          ),
        ],
      ),
    );
  }

  _onTabAdd() {
    ProfileModel profileModel = ProfileModel(
      network: controllerNetwork.text,
      url: controllerUrl.text,
      username: controllerUsername.text,
    );

    profileLink.add(profileModel);
    controllerNetwork.clear();
    controllerUsername.clear();
    controllerUrl.clear();
    setState(() {});
  }

  _listenControllers() {
    controllerNetwork.addListener(() => setState(() {}));
    controllerUsername.addListener(() => setState(() {}));
    controllerUrl.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerNetwork.text.isNotEmpty &&
        controllerUsername.text.isNotEmpty &&
        controllerUrl.text.isNotEmpty;
  }

  _openUrl(String url) async {
    final youtubeUrl = Uri.parse(url);

    try {
      await launchUrl(youtubeUrl);
    } catch (_) {
      _showInvalidUrl();
    }
  }

  _showInvalidUrl() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(
            "Invalid Url :)",
            style: AppTextStyle.seoulRobotoMedium.copyWith(
              color: AppColors.c2A3256,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: AppTextStyle.seoulRobotoMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.c1CB0F6,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controllerNetwork.dispose();
    controllerUsername.dispose();
    controllerUrl.dispose();
    super.dispose();
  }
}
