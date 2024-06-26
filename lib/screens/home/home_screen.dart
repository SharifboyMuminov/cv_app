
import 'package:flutter/material.dart';

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

    );
  }
}
