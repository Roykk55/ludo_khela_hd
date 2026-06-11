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
      backgroundColor: Color(0xFF1A1A2E), // এলা লুডুর ডার্ক থিম
      appBar: AppBar(
        backgroundColor: Color(0xFF16213E),
        title: Row(
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(width: 10),
            Text("প্লেয়ার ৫৪৫", style: TextStyle(fontSize: 16)),
            Spacer(),
            Icon(Icons.monetization_on, color: Colors.yellow),
            Text(" ১২৫০"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ludoButton("২ জন খেলুন", Colors.orange),
                  SizedBox(height: 20),
                  _ludoButton("৪ জন খেলুন", Colors.green),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF16213E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "হোম"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "চ্যাট"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "সেটিং"),
        ],
      ),
    );
  }

  Widget _ludoButton(String text, Color color) {
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)],
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))),
    );
  }
}
