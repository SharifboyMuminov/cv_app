import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/basics/basics_model.dart';
import 'package:cv_app/data/my_models/location/location_model.dart';
import 'package:cv_app/screens/my_cv/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_reg_exp.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainInputScreen extends StatefulWidget {
  const MainInputScreen({super.key});

  @override
  State<MainInputScreen> createState() => _MainInputScreenState();
}

class _MainInputScreenState extends State<MainInputScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerLabel = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerSalary = TextEditingController();

  String? errorTextEmail;
  String _selectedItem = "offline";

  @override
  void initState() {
    Future.microtask(() {
      _selectedItem = context.read<CvBloc>().state.jobLocation;
      if (_selectedItem.isEmpty) {
        _selectedItem = "offline";
      }
      controllerSalary.text =
          context.read<CvBloc>().state.basicsModel.salary.toString();
      controllerName.text = context.read<CvBloc>().state.basicsModel.name;
      controllerEmail.text = context.read<CvBloc>().state.basicsModel.email;
      controllerPhone.text = context.read<CvBloc>().state.basicsModel.phone;
      controllerLabel.text = context.read<CvBloc>().state.basicsModel.label;

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
          "Personal details",
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
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerName,
                    hintText: "Enter full name",
                  ),
                  CvMyInput(
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerLabel,
                    hintText: "Enter job title",
                  ),
                  CvMyInput(
                    errorText: errorTextEmail,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerEmail,
                    hintText: "Enter email",
                  ),
                  CvMyInput(
                    digitsOnly: true,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerSalary,
                    hintText: "Enter salary",
                  ),
                  CvMyInput(
                    textInputAction: TextInputAction.done,
                    margin: EdgeInsets.symmetric(vertical: 6.he),
                    textEditingController: controllerPhone,
                    hintText: "Enter location",
                  ),
                  8.getH(),
                  Row(
                    children: [
                      Text(
                        "Job location",
                        style: AppTextStyle.seoulRobotoMedium.copyWith(
                          color: AppColors.c010A27,
                          fontSize: 17.sp,
                        ),
                      ),
                      10.getW(),
                      Expanded(
                        child: DropdownButton<String>(
                          value: _selectedItem,
                          items: [
                            DropdownMenuItem<String>(
                              value: 'offline',
                              child: Text(
                                'offline',
                                style: AppTextStyle.seoulRobotoRegular.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'online',
                              child: Text(
                                'online',
                                style: AppTextStyle.seoulRobotoRegular.copyWith(
                                  color: AppColors.c010A27,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 20.we,
                            color: AppColors.c010A27,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: AppTextStyle.seoulRobotoRegular.copyWith(
                            color: AppColors.c010A27,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
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
                      CvBasicsSaveEvent(
                        basicsModel: BasicsModel(
                          salary: int.parse(controllerSalary.text),
                          name: controllerName.text,
                          location: LocationModel.initial(),
                          url: "",
                          summary: "",
                          email: controllerEmail.text,
                          phone: controllerPhone.text,
                          image: '',
                          label: controllerLabel.text,
                          profiles: [],
                        ),
                        salary: int.parse(controllerSalary.text),
                        jobLocation: _selectedItem,
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
    controllerName.addListener(() => setState(() {}));
    controllerLabel.addListener(() => setState(() {}));
    controllerPhone.addListener(() => setState(() {}));
    controllerEmail.addListener(() {
      if (controllerEmail.text.isEmpty) {
        setState(() {
          errorTextEmail = 'Email is required';
        });
      } else if (!AppRegExp.emailRegExp.hasMatch(controllerEmail.text)) {
        setState(() {
          errorTextEmail = 'Enter a valid email address';
        });
      } else {
        setState(() {
          errorTextEmail = null;
        });
      }
    });
  }

  bool check() {
    return (controllerName.text.isNotEmpty ||
            controllerLabel.text.isNotEmpty ||
            controllerSalary.text.isNotEmpty ||
            controllerPhone.text.isNotEmpty) &&
        AppRegExp.emailRegExp.hasMatch(controllerEmail.text);
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerLabel.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
    controllerSalary.dispose();

    super.dispose();
  }
}
