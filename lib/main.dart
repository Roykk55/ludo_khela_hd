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
              Expanded(child: _menuCard(context, "Team", Colors.green, Icons.people, GameModeSelectionPage(mode: "Team"))),
              Expanded(child: _menuCard(context, "Private", Colors.orange, Icons.vpn_key, GameModeSelectionPage(mode: "Private"))),
              Expanded(child: _menuCard(context, "VIP", Colors.red, Icons.star, GameModeSelectionPage(mode: "VIP"))),
            ]),
          ])),
        ],
      ),
    );
  }

  Widget _buildHeader(context) => Padding(padding: EdgeInsets.all(15), child: Row(children: [CircleAvatar(backgroundColor: Colors.amber), SizedBox(width: 10), Text("PLAYER_99", style: TextStyle(color: Colors.white)), Spacer(), Icon(Icons.shopping_cart, color: Colors.white), SizedBox(width: 10), Icon(Icons.settings, color: Colors.white)]));

  Widget _menuCard(context, title, color, icon, page) => GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)), child: Container(margin: EdgeInsets.all(5), height: 100, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white), Text(title, style: TextStyle(color: Colors.white))])));
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
  List<Offset> coinPositions = [Offset(10, 10), Offset(150, 10), Offset(10, 150), Offset(150, 150)];
  int diceValue = 1;

  void rollDice() {
    setState(() {
      diceValue = (1 + DateTime.now().microsecond % 6);
      for (int i = 0; i < coinPositions.length; i++) {
        coinPositions[i] = Offset((coinPositions[i].dx + diceValue * 10) % 180, coinPositions[i].dy);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("${widget.mode} - Arena"), backgroundColor: Colors.brown[900]),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 300, width: 300,
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.red, width: 3)),
            child: Stack(
              children: [
                Positioned(top: 0, left: 0, child: Container(width: 100, height: 100, color: Colors.red.withOpacity(0.3))),
                Positioned(top: 0, right: 0, child: Container(width: 100, height: 100, color: Colors.green.withOpacity(0.3))),
                Positioned(bottom: 0, left: 0, child: Container(width: 100, height: 100, color: Colors.yellow.withOpacity(0.3))),
                Positioned(bottom: 0, right: 0, child: Container(width: 100, height: 100, color: Colors.blue.withOpacity(0.3))),
                ...coinPositions.map((pos) => Positioned(left: pos.dx, top: pos.dy, child: Icon(Icons.circle, color: Colors.black, size: 25))).toList(),
              ],
            ),
          ),
          Spacer(),
          Text("Dice: $diceValue", style: TextStyle(fontSize: 40, color: Colors.white)),
          Padding(padding: EdgeInsets.all(20), child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, minimumSize: Size(double.infinity, 60)),
            onPressed: rollDice, 
            child: Text("ROLL DICE", style: TextStyle(fontSize: 24))
          )),
        ],
      ),
    );
  }
}
