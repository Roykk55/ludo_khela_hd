import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoGameBoardPage()));

class LudoGameBoardPage extends StatefulWidget {
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  // ১৬টি গুটির জন্য ১৬টি পজিশন (বোর্ডের চারপাশ অনুযায়ী)
  List<Offset> positions = List.generate(16, (i) {
    if (i < 4) return Offset(20, 20 + (i * 20));  // লাল গুটি
    if (i < 8) return Offset(260, 20 + ((i - 4) * 20)); // সবুজ গুটি
    if (i < 12) return Offset(20 + ((i - 8) * 20), 260); // হলুদ গুটি
    return Offset(260 - ((i - 12) * 20), 260); // নীল গুটি
  });

  void moveCoins() {
    setState(() {
      int dice = (1 + DateTime.now().microsecond % 6);
      for (int i = 0; i < 16; i++) {
        // নতুন লজিক: গুটিগুলো এখন বর্গাকার পথে ঘুরবে
        double x = positions[i].dx;
        double y = positions[i].dy;

        if (x < 260 && y == 20) x += (dice * 10); // উপরে ডানে যাবে
        else if (x >= 260 && y < 260) y += (dice * 10); // ডানে নিচে যাবে
        else if (x > 20 && y >= 260) x -= (dice * 10); // নিচে বামে যাবে
        else y -= (dice * 10); // বামে উপরে যাবে

        positions[i] = Offset(x.clamp(20.0, 260.0), y.clamp(20.0, 260.0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 300, height: 300, color: Colors.white,
          child: Stack(children: [
            // ৪টি রঙের জোন
            Positioned(top: 0, left: 0, child: Container(width: 150, height: 150, color: Colors.red.withOpacity(0.2))),
            Positioned(top: 0, right: 0, child: Container(width: 150, height: 150, color: Colors.green.withOpacity(0.2))),
            Positioned(bottom: 0, left: 0, child: Container(width: 150, height: 150, color: Colors.yellow.withOpacity(0.2))),
            Positioned(bottom: 0, right: 0, child: Container(width: 150, height: 150, color: Colors.blue.withOpacity(0.2))),
            
            // ১৬টি গুটি
            ...List.generate(16, (i) => Positioned(
              left: positions[i].dx, top: positions[i].dy,
              child: Icon(Icons.circle, color: (i < 4) ? Colors.red : (i < 8) ? Colors.green : (i < 12) ? Colors.yellow : Colors.blue, size: 20),
            )),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: moveCoins,
        child: Icon(Icons.casino),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
