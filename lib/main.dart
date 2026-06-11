import 'package:flutter/material.dart'; // এখানে 'import' ছোট হাতের অক্ষরে হবে

void main() => runApp(LudoApp());

class LudoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LudoMainScreen(),
    );
  }
}

class LudoMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildGameOptions()),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Padding(
    padding: EdgeInsets.only(top: 50, left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(radius: 25, backgroundColor: Colors.orange, child: Icon(Icons.person, color: Colors.white)),
        Text("PLAYER_99", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(20)), child: Row(children: [Icon(Icons.monetization_on, color: Colors.yellow), Text(" 50K")])),
      ],
    ),
  );

  Widget _buildGameOptions() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _actionButton("Online Match", Colors.blueAccent, Icons.public),
      SizedBox(height: 20),
      _actionButton("Play with Friends", Colors.green, Icons.group),
      SizedBox(height: 20),
      _actionButton("Tournament", Colors.purple, Icons.emoji_events),
    ],
  );

  Widget _actionButton(String text, Color color, IconData icon) => Container(
    width: 280,
    height: 70,
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(35), boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 5))]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 30), SizedBox(width: 10), Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))],
    ),
  );

  Widget _buildBottomNav() => BottomNavigationBar(
    backgroundColor: Colors.transparent,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat"),
      BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Rank"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
    ],
  );
}
