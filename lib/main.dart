import 'package:flutter/material.dart';

void main() => runApp(LudoApp());

class LudoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LudoHomeScreen(),
    );
  }
}

class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], // এলা লুডুর ব্যাকগ্রাউন্ডের মতো গাঢ় রঙ
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("এলা লুডু ক্লোন", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 50),
            _buildMenuButton("২ জন খেলুন", Colors.orange),
            SizedBox(height: 20),
            _buildMenuButton("৪ জন খেলুন", Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(String title, Color color) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {},
        child: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
