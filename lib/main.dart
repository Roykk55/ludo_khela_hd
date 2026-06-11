import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoHomeScreen()));

class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71),
      body: Column(
        children: [
          // উন্নত হেডার (কয়েন, জেমস, সেটিংস)
          _buildTopBar(),
          
          // মেইন লোগো
          Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text("LUDO", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white))),

          // গেম ব্যানার (২ ও ৪ প্লেয়ার)
          Container(height: 150, margin: EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(15)), child: Center(child: Text("2 & 4 PLAYERS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)))),

          // টিম, প্রাইভেট, ভিআইপি কার্ডস
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                _gameIcon("Team", Colors.green),
                _gameIcon("Private", Colors.orange),
                _gameIcon("VIP", Colors.redAccent),
              ],
            ),
          ),
          
          // স্লাইডার এবং বটম নেভিগেশন
          _buildSlider(),
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildTopBar() => SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.amber),
          SizedBox(width: 10),
          Expanded(child: Text("PLAYER_99", style: TextStyle(color: Colors.white))),
          Container(padding: EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(10)), child: Text("486.3K + 💎 1 +", style: TextStyle(color: Colors.white))),
          IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () {}),
        ],
      ),
    ),
  );

  Widget _gameIcon(String title, Color color) => Column(
    children: [
      Container(height: 80, width: 80, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white, width: 2))),
      Text(title, style: TextStyle(color: Colors.white)),
    ],
  );

  Widget _buildSlider() => Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.circle, size: 10, color: Colors.white), SizedBox(width: 5), Icon(Icons.circle, size: 10, color: Colors.white54)]),
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
