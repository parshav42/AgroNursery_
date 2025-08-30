import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';
import 'farmer_home.dart';

class FarmerLoginPage extends StatefulWidget {
  const FarmerLoginPage({super.key});

  @override
  _FarmerLoginPageState createState() => _FarmerLoginPageState();
}

class _FarmerLoginPageState extends State<FarmerLoginPage> {
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String phone = "";
  String otp = "";
  String verificationId = "";
  bool otpSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Farmer Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!otpSent) ...[
              TextField(
                decoration: InputDecoration(labelText: "Phone Number"),
                onChanged: (val) => phone = val,
              ),
              ElevatedButton(
                child: Text("Send OTP"),
                onPressed: () async {
                  await _authService.signInWithPhone("+91$phone",
                      (verId, token) {
                    setState(() {
                      verificationId = verId;
                      otpSent = true;
                    });
                  });
                },
              )
            ] else ...[
              TextField(
                decoration: InputDecoration(labelText: "Enter OTP"),
                onChanged: (val) => otp = val,
              ),
              ElevatedButton(
                child: Text("Verify OTP"),
                onPressed: () async {
                  var userCred =
                      await _authService.verifyOtp(verificationId, otp);

                  // Check if user exists in Firestore
                  DocumentSnapshot doc = await _firestore
                      .collection("Users")
                      .doc(userCred.user!.uid)
                      .get();

                  if (!doc.exists) {
                    // New user → ask for name
                    await _firestore
                        .collection("Users")
                        .doc(userCred.user!.uid)
                        .set({
                      "uid": userCred.user!.uid,
                      "phone": phone,
                      "role": "farmer",
                      "name": "Farmer $phone", // later edit name
                    });
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => FarmerHomePage()),
                  );
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}
