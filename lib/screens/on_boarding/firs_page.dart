import 'package:flutter/material.dart';

class FirsPage extends StatelessWidget {
  const FirsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Center(child: Image.asset("assets/images/book.png"))],
      ),
    );
  }
}
