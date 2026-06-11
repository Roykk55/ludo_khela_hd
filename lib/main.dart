import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainNavigationScreen()));

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 1; // ডিফল্টভাবে 'Battle' (LudoHomeScreen) সিলেক্ট থাকবে

  final List<Widget> _pages = [
    Center(child: Text("Events Page", style: TextStyle(color: Colors.white, fontSize: 24))),
    LudoHomeScreen(),
    Center(child: Text("Social Page", style: TextStyle(color: Colors.white, fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Color(0xFF003D4D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Events"),
          BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: "Battle"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social"),
        ],
      ),
    );
  }
}

class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildHeader(context),
          Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("LUDO", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold))),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                _buildMainButton(context),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _menuCard(context, "Team", Colors.green, Icons.people, GameModeSelectionPage(mode: "Team"))),
                    Expanded(child: _menuCard(context, "Private", Colors.orange, Icons.vpn_key, GameModeSelectionPage(mode: "Private"))),
                    Expanded(child: _menuCard(context, "VIP", Colors.red, Icons.star, GameModeSelectionPage(mode: "VIP"))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Padding(
    padding: EdgeInsets.all(15), 
    child: Row(children: [
      GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage())), child: CircleAvatar(backgroundColor: Colors.amber)),
      SizedBox(width: 10),
      Text("PLAYER_99", style: TextStyle(color: Colors.white)),
      Spacer(),
      IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StorePage()))),
      IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()))),
    ])
  );

  Widget _buildMainButton(BuildContext context) => GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GameModeSelectionPage(mode: "2 & 4 PLAYERS"))),
    child: Container(height: 120, width: double.infinity, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15)), child: Center(child: Text("2 & 4 PLAYERS", style: TextStyle(color: Colors.white, fontSize: 20)))),
  );
  
  Widget _menuCard(BuildContext context, String title, Color color, IconData icon, Widget page) => GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    child: Container(margin: EdgeInsets.all(5), height: 100, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white), Text(title, style: TextStyle(color: Colors.white))])),
  );
}

class GameModeSelectionPage extends StatelessWidget {
  final String mode;
  GameModeSelectionPage({required this.mode});
  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text(mode), backgroundColor: Color(0xFF003D4D)), body: Column(children: [Padding(padding: EdgeInsets.all(20), child: Text("Select Mode", style: TextStyle(color: Colors.white, fontSize: 20))), Wrap(children: ["Classic", "Master", "Quick", "Magic"].map((m) => Container(margin: EdgeInsets.all(10), padding: EdgeInsets.all(20), color: Colors.white24, child: Text(m, style: TextStyle(color: Colors.white)))).toList()), Spacer(), Padding(padding: EdgeInsets.all(20), child: ElevatedButton(onPressed: () {}, child: Text("START GAME"), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))))]));
}

class ProfilePage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Profile")), body: Center(child: Text("Profile Settings"))); }
class StorePage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Shop")), body: Center(child: Text("Shop Active"))); }
class SettingsPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Settings")), body: Center(child: Text("Settings Active"))); }
