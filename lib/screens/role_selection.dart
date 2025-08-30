import 'package:flutter/material.dart';
import 'farmer_login.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AgroNursery - Choose Role")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("👨‍🌾 Farmer"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FarmerLoginPage()),
                );
              },
            ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   child: Text("🌿 Nursery Owner"),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (_) => NurseryLoginPage()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
