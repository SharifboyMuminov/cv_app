import 'dart:io';

import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/models/network_response.dart';
import 'package:cv_app/screens/dialog/image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assalomu aleykum"),
      ),
      body: imageUrl.isNotEmpty
          ? Center(
              child: Image.network(imageUrl),
            )
          : SizedBox(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showImageDialog(
            context,
            onChaneXFile: (XFile? value) async {
              NetworkResponse networkResponse = await ApiProvider().uploadImage(File(value!.path));
              imageUrl = networkResponse.data;
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
