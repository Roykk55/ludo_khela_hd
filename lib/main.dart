import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoHomeScreen()));

class LudoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005C71), // এলা লুডুর মতো নীল থিম
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(20),
              children: [
                _gameCard("Team", Colors.green, Icons.group_add),
                _gameCard("Private", Colors.orange, Icons.lock),
                _gameCard("VIP", Colors.redAccent, Icons.star),
                _gameCard("Classic", Colors.blueAccent, Icons.casino),
              ],
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildHeader() => Padding(
    padding: EdgeInsets.only(top: 50, left: 20, right: 20),
    child: Row(
      children: [
        CircleAvatar(radius: 20, backgroundColor: Colors.amber),
        SizedBox(width: 10),
        Text("PLAYER_99", style: TextStyle(color: Colors.white)),
        Spacer(),
        Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), color: Colors.black26, child: Text("50K 💎", style: TextStyle(color: Colors.white))),
      ],
    ),
  );

  Widget _gameCard(String title, Color color, IconData icon) => Card(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 50, color: Colors.white), Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))],
    ),
  );

  Widget _buildBottomNav() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xFF003D4D),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white54,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Events"),
      BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: "Battle"),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social"),
    ],
  );
}
