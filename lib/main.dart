import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("LUDO", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white))),
            _buildMainBanner(context),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(children: [Expanded(child: _menuCard("Team", Colors.green)), Expanded(child: _menuCard("Private", Colors.orange))]),
            ),
            Spacer(),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Padding(
    padding: EdgeInsets.all(15),
    child: Row(
      children: [
        GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage())), child: CircleAvatar(radius: 20, backgroundColor: Colors.amber)),
        Spacer(),
        IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StorePage()))),
        IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()))),
      ],
    ),
  );

  Widget _buildMainBanner(BuildContext context) => Container(height: 150, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.cyan]), borderRadius: BorderRadius.circular(15)), child: Center(child: Text("2 & 4 PLAYERS", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))));
  Widget _menuCard(String title, Color color) => Container(margin: EdgeInsets.all(5), height: 80, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)), child: Center(child: Text(title, style: TextStyle(color: Colors.white))));
  Widget _buildBottomNav() => BottomNavigationBar(backgroundColor: Color(0xFF003D4D), selectedItemColor: Colors.white, unselectedItemColor: Colors.white54, items: [BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Events"), BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: "Battle"), BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social")]);
}

// --- প্রোফাইল পেজ ---
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text("Profile")), body: Center(child: Text("Profile Settings Active", style: TextStyle(color: Colors.white))));
  }
}

// --- সেটিংস পেজ (প্যাকেজ ছাড়াই কাজ করবে) ---
class SettingsPage extends StatelessWidget {
  // অ্যান্ড্রয়েড নেটিভ ইন্টেন্ট ব্যবহার করে ফেসবুক ও ফোনে নিয়ে যাবে
  final platform = const MethodChannel('com.ludo.app/navigation');

  void _openFacebook() async {
    try {
      await platform.invokeMethod('openFacebook');
    } catch (e) {
      print("Facebook link triggered");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text("Settings")), body: Column(children: [
      ListTile(title: Text("Bind Facebook", style: TextStyle(color: Colors.white)), leading: Icon(Icons.facebook, color: Colors.blue), onTap: _openFacebook),
      ListTile(title: Text("Bind Mobile", style: TextStyle(color: Colors.white)), leading: Icon(Icons.phone, color: Colors.green), onTap: () => print("Mobile Bind Clicked")),
    ]));
  }
}

// --- স্টোর পেজ ---
class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text("Shop")), body: Center(child: Text("Store System Active", style: TextStyle(color: Colors.white))));
  }
}
