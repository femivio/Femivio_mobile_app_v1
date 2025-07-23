import 'package:flutter/material.dart';

class HairStyleScreen extends StatelessWidget {
  const HairStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hair Style")),
      body: const Center(child: Text("Hair Styling Page")),
    );
  }
}
