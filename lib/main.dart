import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoHomeScreen()));

// --- ১. মেইন হোম স্ক্রিন ---
class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("LUDO", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 5))),
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

// --- ২. প্রোফাইল পেজ (নাম এডিট ও ফ্রেম আনলক) ---
class ProfilePage extends StatefulWidget {
  @override _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController(text: "PLAYER_99");
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text("Edit Profile"), backgroundColor: Color(0xFF003D4D)), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [
      TextField(controller: _nameController, style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: "Enter Name", labelStyle: TextStyle(color: Colors.white))),
      SizedBox(height: 20),
      Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), itemCount: 10, itemBuilder: (context, i) => Container(margin: EdgeInsets.all(5), decoration: BoxDecoration(border: Border.all(color: Colors.white)), child: Icon(Icons.person, color: Colors.white)))),
    ])));
  }
}

// --- ৩. সেটিংস (ফেসবুক/মোবাইল বাইন্ডিং) ---
class SettingsPage extends StatelessWidget {
  Future<void> _launchURL(String url) async => await launchUrl(Uri.parse(url));
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text("Settings")), body: Column(children: [
      ListTile(title: Text("Bind Facebook", style: TextStyle(color: Colors.white)), leading: Icon(Icons.facebook, color: Colors.blue), onTap: () => _launchURL("https://www.facebook.com")),
      ListTile(title: Text("Bind Mobile", style: TextStyle(color: Colors.white)), leading: Icon(Icons.phone, color: Colors.green), onTap: () => _launchURL("tel:000000")),
    ]));
  }
}

// --- ৪. স্টোর পেজ (টলি আইকন) ---
class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text("Shop")), body: Center(child: Text("Shop items coming soon!", style: TextStyle(color: Colors.white))));
  }
}
