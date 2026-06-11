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
            // হেডার
            _buildHeader(context),
            Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("LUDO", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold))),
            
            // বাটনসমূহ (একই Column এর ভেতরে নিরাপদ)
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(15),
                children: [
                  _buildMainButton(context),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _menuCard(context, "Team", Colors.green, Icons.people, TeamPage())),
                      Expanded(child: _menuCard(context, "Private", Colors.orange, Icons.vpn_key, PrivatePage())),
                      Expanded(child: _menuCard(context, "VIP", Colors.red, Icons.star, VipPage())),
                    ],
                  ),
                ],
              ),
            ),
            _buildBottomNav(),
          ],
        ),
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

  Widget _buildMainButton(BuildContext context) => Container(height: 120, width: double.infinity, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15)), child: Center(child: Text("2 & 4 PLAYERS", style: TextStyle(color: Colors.white, fontSize: 20))));
  
  Widget _menuCard(BuildContext context, String title, Color color, IconData icon, Widget page) => GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    child: Container(margin: EdgeInsets.all(5), height: 100, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white), Text(title, style: TextStyle(color: Colors.white))])),
  );

  Widget _buildBottomNav() => BottomNavigationBar(backgroundColor: Color(0xFF003D4D), selectedItemColor: Colors.white, unselectedItemColor: Colors.white54, items: [BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Events"), BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: "Battle"), BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social")]);
}

// পেজগুলো
class ProfilePage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Profile")), body: Center(child: Text("Profile Settings"))); }
class StorePage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Shop")), body: Center(child: Text("Shop Active"))); }
class SettingsPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Settings")), body: Center(child: Text("Settings Active"))); }
class TeamPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Team Mode")), body: Center(child: Text("Team Active"))); }
class PrivatePage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Private Mode")), body: Center(child: Text("Private Active"))); }
class VipPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("VIP Mode")), body: Center(child: Text("VIP Active"))); }
