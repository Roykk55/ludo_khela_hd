import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoHomeScreen()));

class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("LUDO", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold))),
            
            // মেইন বাটন
            _buildMainButton(context),

            // বাটনগুলো যাতে গায়েব না হয় সেজন্য Expanded ব্যবহার করেছি
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    _menuCard(context, "Team", Colors.green, Icons.people, TeamPage()),
                    _menuCard(context, "Private", Colors.orange, Icons.vpn_key, PrivatePage()),
                    _menuCard(context, "VIP", Colors.red, Icons.star, VipPage()),
                  ],
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, Color color, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white, size: 30), Text(title, style: TextStyle(color: Colors.white))]),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Padding(padding: EdgeInsets.all(15), child: Row(children: [CircleAvatar(backgroundColor: Colors.amber), SizedBox(width: 10), Text("PLAYER_99", style: TextStyle(color: Colors.white)), Spacer(), Text("\$ 486.3K", style: TextStyle(color: Colors.white)), IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () {})]));
  Widget _buildMainButton(BuildContext context) => Container(margin: EdgeInsets.symmetric(horizontal: 20), height: 120, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15)), child: Center(child: Text("2 & 4 PLAYERS", style: TextStyle(color: Colors.white, fontSize: 20))));
  Widget _buildBottomNav() => BottomNavigationBar(backgroundColor: Color(0xFF003D4D), selectedItemColor: Colors.white, unselectedItemColor: Colors.white54, items: [BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Events"), BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: "Battle"), BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social")]);
}

// নতুন পেজ
class TeamPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Team Mode")), body: Center(child: Text("Team Mode Page"))); }
class PrivatePage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Private Mode")), body: Center(child: Text("Private Mode Page"))); }
class VipPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("VIP Mode")), body: Center(child: Text("VIP Mode Page"))); }
