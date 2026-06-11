import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Roboto'),
    home: LudoHomeScreen(),
  ));
}

// --- ১. মেইন হোম স্ক্রিন ---
class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71), // এলা লুডুর সিগনেচার ব্লু
      body: SafeArea(
        child: Column(
          children: [
            // টপ বার (প্রোফাইল, কয়েন, সেটিংস)
            _buildTopBar(context),
            
            // লোগো সেকশন
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "LUDO",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3,
                  shadows: [Shadow(color: Colors.black, blurRadius: 15, offset: Offset(2, 2))],
                ),
              ),
            ),

            // ২ ও ৪ প্লেয়ার মেইন ব্যানার (সচল বাটন)
            _buildMainBanner(context),

            // টিম, প্রাইভেট, ভিআইপি বাটন গ্রিড
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  _gameCard(context, "Team", Colors.green, Icons.people, "টিম মোড"),
                  _gameCard(context, "Private", Colors.orange, Icons.vpn_key, "প্রাইভেট রুম"),
                  _gameCard(context, "VIP", Colors.redAccent, Icons.stars, "ভিআইপি এরিনা"),
                ],
              ),
            ),

            // লিগ এবং র‍্যাঙ্ক সেকশন
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  _infoBox("League", "NO.163"),
                  SizedBox(width: 10),
                  _infoBox("Rank", "NO.1000+"),
                ],
              ),
            ),

            Spacer(),
            
            // বটম নেভিগেশন বার
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  // --- উইজেট ফাংশনসমূহ ---

  Widget _buildTopBar(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      children: [
        CircleAvatar(radius: 22, backgroundColor: Colors.amber, child: Icon(Icons.person, color: Colors.white)),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PLAYER_99", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            Text("Level 5", style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Icon(Icons.monetization_on, color: Colors.yellow, size: 18),
              SizedBox(width: 5),
              Text("486.3K", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Icon(Icons.diamond, color: Colors.cyanAccent, size: 18),
              SizedBox(width: 5),
              Text("1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () {}),
      ],
    ),
  );

  Widget _buildMainBanner(BuildContext context) => GestureDetector(
    onTap: () => _navigateToRoom(context, "Classic Match", "2 & 4 Players"),
    child: Container(
      height: 160,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white30, width: 2),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.casino, size: 60, color: Colors.white),
            Text("2 & 4 PLAYERS", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    ),
  );

  Widget _gameCard(BuildContext context, String title, Color color, IconData icon, String modeName) => Expanded(
    child: GestureDetector(
      onTap: () => _navigateToRoom(context, title, modeName),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 110,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );

  Widget _infoBox(String title, String value) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.white60, fontSize: 12)),
          Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    ),
  );

  Widget _buildBottomNav() => BottomNavigationBar(
    backgroundColor: Color(0xFF003D4D),
    selectedItemColor: Colors.yellow,
    unselectedItemColor: Colors.white54,
    currentIndex: 1,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Events"),
      BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: "Battle"),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social"),
    ],
  );

  // নেভিগেশন ফাংশন
  void _navigateToRoom(BuildContext context, String title, String mode) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameRoomScreen(title: title, mode: mode)),
    );
  }
}

// --- ২. গেম রুম স্ক্রিন (বাটনে ক্লিক করলে যা আসবে) ---
class GameRoomScreen extends StatelessWidget {
  final String title;
  final String mode;

  GameRoomScreen({required this.title, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFF003D4D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.group, size: 100, color: Colors.white24),
            SizedBox(height: 20),
            Text("Welcome to $mode", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("সার্ভারের সাথে কানেক্ট হচ্ছে...", style: TextStyle(color: Colors.white70)),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              onPressed: () => Navigator.pop(context),
              child: Text("BACK TO LOBBY", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
