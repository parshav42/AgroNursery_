import 'package:flutter/material.dart';

class FarmerHomePage extends StatelessWidget {
  const FarmerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Farmer Home")),
      body: Center(child: Text("Welcome Farmer! Search Crops here.")),
    );
  }
}
