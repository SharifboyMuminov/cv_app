import 'dart:io';

import 'package:cv_app/bloc/cv_bloc/cv_bloc.dart';
import 'package:cv_app/bloc/cv_bloc/cv_event.dart';
import 'package:cv_app/data/my_models/basics/basics_model.dart';
import 'package:cv_app/data/my_models/location/location_model.dart';
import 'package:cv_app/screens/dialog/image_dialog.dart';
import 'package:cv_app/screens/widget/cv_input.dart';
import 'package:cv_app/screens/widget/global_button.dart';
import 'package:cv_app/utils/app_colors.dart';
import 'package:cv_app/utils/app_images.dart';
import 'package:cv_app/utils/app_reg_exp.dart';
import 'package:cv_app/utils/app_size.dart';
import 'package:cv_app/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

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
  File? imageFile;

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
      imageFile = context.read<CvBloc>().state.imageFile;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // showImageDialog

                  SizedBox(
                    child: GestureDetector(
                      child: Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageFile != null
                                ? FileImage(imageFile!)
                                : const NetworkImage(
                                    "https://icons.veryicon.com/png/o/internet--web/55-common-web-icons/person-4.png",
                                  ),
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(
                                CupertinoColors.activeBlue.value,
                              ).withOpacity(.6),
                              Color(
                                CupertinoColors.activeBlue.value,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {
                        showImageDialog(context, onChaneXFile: (XFile? value) {
                          if (value != null) {
                            imageFile = File(value.path);
                            context.read<CvBloc>().add(
                                  CvChangeImageFileEvent(
                                    imageFile: imageFile!,
                                  ),
                                );
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  20.getH(),

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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border:
                            Border.all(color: CupertinoColors.activeOrange)),
                    child: Column(
                      children: [
                        5.getH(),
                        Text(
                          "Work type",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        ListTile(
                          title: const Text('online'),
                          onTap: () {
                            setState(() {
                              _selectedItem = "online";
                            });
                          },
                          leading: Radio<String>(
                            activeColor: CupertinoColors.activeBlue,
                            value: 'online',
                            groupValue: _selectedItem,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem = value!;
                              });
                              setState(() {});
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.55,
                          color: CupertinoColors.systemOrange.withOpacity(.5),
                        ),
                        ListTile(
                          title: const Text('Offline'),
                          onTap: () {
                            setState(() {});
                            _selectedItem = "offline";
                          },
                          leading: Radio<String>(
                            value: 'offline',
                            activeColor: CupertinoColors.activeBlue,
                            groupValue: _selectedItem,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem = value!;
                              });
                              setState(() {});
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.55,
                          color: CupertinoColors.systemOrange.withOpacity(.5),
                        ),
                        ListTile(
                          title: const Text('Both'),
                          onTap: () {
                            setState(() {
                              _selectedItem = "both";
                            });
                          },
                          leading: Radio<String>(
                            activeColor: CupertinoColors.activeBlue,
                            value: 'both',
                            groupValue: _selectedItem,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem = value!;
                              });
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
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
