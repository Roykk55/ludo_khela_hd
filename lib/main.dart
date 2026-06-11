import 'package:flutter/material.dart';

void main() => runApp(LudoApp());

class LudoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LudoHomeScreen(),
    );
  }
}

class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("এলা লুডু ক্লোন")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("লুডু খেলা এইচডি", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {}, 
              child: Text("২ জন খেলুন")
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {}, 
              child: Text("৪ জন খেলুন")
            ),
          ],
        ),
      ),
    );
  }
}

