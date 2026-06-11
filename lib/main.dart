import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainNavigationScreen()));

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 1;
  final List<Widget> _pages = [
    Center(child: Text("Events", style: TextStyle(color: Colors.white))),
    LudoHomeScreen(),
    Center(child: Text("Social", style: TextStyle(color: Colors.white))),
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
          Expanded(child: ListView(padding: EdgeInsets.all(15), children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GameModeSelectionPage(mode: "2 & 4 PLAYERS"))),
              child: Container(height: 120, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15)), child: Center(child: Text("2 & 4 PLAYERS", style: TextStyle(color: Colors.white, fontSize: 20)))),
            ),
            SizedBox(height: 20),
            Row(children: [
              _menuCard(context, "Team", Colors.green, Icons.people, GameModeSelectionPage(mode: "Team")),
              _menuCard(context, "Private", Colors.orange, Icons.vpn_key, GameModeSelectionPage(mode: "Private")),
              _menuCard(context, "VIP", Colors.red, Icons.star, GameModeSelectionPage(mode: "VIP")),
            ]),
          ])),
        ],
      ),
    );
  }

  Widget _buildHeader(context) => Padding(padding: EdgeInsets.all(15), child: Row(children: [CircleAvatar(backgroundColor: Colors.amber), SizedBox(width: 10), Text("PLAYER_99", style: TextStyle(color: Colors.white)), Spacer(), Icon(Icons.shopping_cart, color: Colors.white), SizedBox(width: 10), Icon(Icons.settings, color: Colors.white)]));

  Widget _menuCard(context, title, color, icon, page) => Expanded(child: GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)), child: Container(margin: EdgeInsets.all(5), height: 100, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white), Text(title, style: TextStyle(color: Colors.white))]))));
}

class GameModeSelectionPage extends StatelessWidget {
  final String mode;
  GameModeSelectionPage({required this.mode});
  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: Color(0xFF005C71), appBar: AppBar(title: Text("$mode Mode"), backgroundColor: Color(0xFF003D4D)), body: Column(children: [Padding(padding: EdgeInsets.all(20), child: Text("Select Amount", style: TextStyle(color: Colors.white))), ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LudoGameBoardPage(mode: mode))), child: Text("START GAME"))]));
}

class LudoGameBoardPage extends StatefulWidget {
  final String mode;
  LudoGameBoardPage({required this.mode});
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  double x = 10, y = 10;
  void roll() {
    setState(() {
      x = (x + 30) % 300;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.brown[900], appBar: AppBar(title: Text(widget.mode)), body: Center(child: Container(width: 300, height: 300, color: Colors.white, child: Stack(children: [Positioned(left: x, top: y, child: Icon(Icons.circle, color: Colors.red, size: 30))]))), floatingActionButton: FloatingActionButton(onPressed: roll, child: Icon(Icons.play_arrow)));
  }
}
