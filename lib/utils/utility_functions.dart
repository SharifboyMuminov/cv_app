import 'dart:io';

import 'package:cv_app/bloc/user/user_bloc.dart';
import 'package:cv_app/bloc/user/user_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../data/models/image_model.dart';

void takeAnImage(
  BuildContext context, {
  required int limit,
  required List<ImageModel> images,
  bool? isProfile,
  ImageModel? imageModel,
}) {
  showCupertinoModalPopup(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              await _getImageFromCamera(context);
            },
            child: const Text(
              "Take from Camera",
              style: TextStyle(
                  color: CupertinoColors.activeBlue,
                  fontWeight: FontWeight.w400),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await _getImageFromGallery(context,
                  limit: limit, isProfile: isProfile);
            },
            child: const Text(
              "Choose from gallery",
              style: TextStyle(
                  color: CupertinoColors.activeBlue,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> _getImageFromGallery(
  BuildContext context, {
  required int limit,
  bool? isProfile,
}) async {
  final ImagePicker picker = ImagePicker();

  XFile? image = await picker.pickImage(
    maxHeight: 1024,
    maxWidth: 1024,
    source: ImageSource.gallery,
  );

  if (image != null) {
    File file = File(image.path);
    if (!context.mounted) return;
    context.read<UserBloc>().add(UserProfilePhotoEvent(file: file));
  }
  if (!context.mounted) return;
  Navigator.pop(context);
}

Future<void> _getImageFromCamera(
  BuildContext context,
) async {
  final ImagePicker picker = ImagePicker();

  XFile? image = await picker.pickImage(
    source: ImageSource.camera,
    maxHeight: 1024,
    maxWidth: 1024,
  );
  if (image != null) {
    File file = File(image.path);
    if (!context.mounted) return;
    context.read<UserBloc>().add(UserProfilePhotoEvent(file: file));
  }
  if (!context.mounted) return;
  Navigator.pop(context);
}
