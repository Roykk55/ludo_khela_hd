import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoHomeScreen()));

class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71),
      body: Column(
        children: [
          // ১. হেডার সেকশন
          Padding(
            padding: EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Row(
              children: [
                CircleAvatar(radius: 20, backgroundColor: Colors.amber),
                SizedBox(width: 10),
                Text("PLAYER_99", style: TextStyle(color: Colors.white, fontSize: 16)),
                Spacer(),
                Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20)), child: Text("486.3K + 💎 1 +", style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
          
          // ২. লোগো বা টাইটেল সেকশন
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("LUDO", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white, shadows: [Shadow(color: Colors.black, blurRadius: 10)])),
          ),

          // ৩. গেম মোড কার্ডস
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(20),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                _gameCard("Team", Colors.green, Icons.group_add),
                _gameCard("Private", Colors.orange, Icons.lock),
                _gameCard("VIP", Colors.redAccent, Icons.star),
                _gameCard("Classic", Colors.blueAccent, Icons.casino),
              ],
            ),
          ),

          // ৪. নিচে লিগ এবং র‍্যাঙ্ক ব্যানার
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(child: _infoBox("League", "NO.163")),
                SizedBox(width: 10),
                Expanded(child: _infoBox("Rank", "NO.1000+")),
              ],
            ),
          ),

          // ৫. বটম নেভিগেশন
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _gameCard(String title, Color color, IconData icon) => Card(
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 50, color: Colors.white), Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))],
    ),
  );

  Widget _infoBox(String title, String value) => Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(10)),
    child: Column(children: [Text(title, style: TextStyle(color: Colors.white70)), Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
  );

  Widget _buildBottomNav() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xFF003D4D),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white54,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Events"),
      BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: "Battle"),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social"),
    ],
  );
}
