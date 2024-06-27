import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/location/location_model.dart';
import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationInputScreen extends StatefulWidget {
  const LocationInputScreen({super.key});

  @override
  State<LocationInputScreen> createState() => _LocationInputScreenState();
}

class _LocationInputScreenState extends State<LocationInputScreen> {
  final TextEditingController controllerCity = TextEditingController();
  final TextEditingController controllerCountryCode = TextEditingController();
  final TextEditingController controllerRegion = TextEditingController();

  @override
  void initState() {
    _listenControllers();
    Future.microtask(() {
      controllerCity.text = context.read<CvBloc>().state.locationModel.city;
      controllerCountryCode.text =
          context.read<CvBloc>().state.locationModel.countryCode;
      controllerRegion.text = context.read<CvBloc>().state.locationModel.region;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Location",
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
                children: [
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerCity,
                    hintText: "Enter city",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerCountryCode,
                    hintText: "Enter countryCode",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerRegion,
                    hintText: "region",
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            active: !check(),
            onTab: () {
              if (check()) {
                context.read<CvBloc>().add(
                      CvLocationSaveEvent(
                        locationModel: LocationModel(
                          city: controllerCity.text,
                          countryCode: controllerCountryCode.text,
                          region: controllerRegion.text,
                        ),
                      ),
                    );
                Navigator.pop(context);
              }
            },
            title: "Save",
          ),
        ],
      ),
    );
  }

  _listenControllers() {
    controllerCity.addListener(() => setState(() {}));
    controllerCountryCode.addListener(() => setState(() {}));
    controllerRegion.addListener(() => setState(() {}));
  }

  bool check() {
    return controllerCity.text.isNotEmpty &&
        controllerCountryCode.text.isNotEmpty &&
        controllerRegion.text.isNotEmpty;
  }

  @override
  void dispose() {
    controllerCity.dispose();
    controllerCountryCode.dispose();
    controllerRegion.dispose();
    super.dispose();
  }
}
