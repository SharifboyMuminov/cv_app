import 'package:cv_app/screens/widget/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

showImageDialog(BuildContext context,
    {required ValueChanged<XFile?> onChaneXFile}) async {
  XFile? xFile;

  Future<void> pickerImageFromGallery() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );

    onChaneXFile.call(xFile);
  }

  Future<void> pickerImageFromCamera() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );

    onChaneXFile.call(xFile);
  }

  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.r),
        topRight: Radius.circular(15.r),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
              width: 90.w,
              height: 5.h,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            DialogButtons(
              onTab: () {
                pickerImageFromGallery();
                Navigator.pop(context);
              },
              iconData: Icons.image,
              title: "Gallery",
            ),
            DialogButtons(
              onTab: () {
                pickerImageFromCamera();
                Navigator.pop(context);
              },
              iconData: Icons.camera_alt,
              title: "Camera",
            ),
          ],
        ),
      );
    },
  );
}
