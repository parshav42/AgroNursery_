import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/role_selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const AgroNurseryApp());
}

class AgroNurseryApp extends StatelessWidget {
  const AgroNurseryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroNursery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RoleSelectionPage(), // Start from Role Selection
    );
  }
}
