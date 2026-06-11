import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoGameBoard()));

class LudoGameBoard extends StatefulWidget {
  @override
  _LudoGameBoardState createState() => _LudoGameBoardState();
}

class _LudoGameBoardState extends State<LudoGameBoard> {
  // ১৬টি গুটির পজিশন লিস্ট - ৪টি রঙের জন্য ১৬টি গুটি
  List<Offset> coinPositions = List.generate(16, (i) {
    // প্রতি ৪টি গুটিকে বোর্ডের আলাদা আলাদা কর্নারে সাজানোর লজিক
    double x = (i % 4) * 40.0 + 20.0;
    double y = (i ~/ 4) * 40.0 + 20.0;
    return Offset(x, y);
  });

  void rollDice() {
    setState(() {
      int dice = (1 + DateTime.now().microsecond % 6);
      // গুটিগুলো যেন এলোমেলোভাবে না নড়ে, বরং একটি নির্দিষ্ট দূরত্বে নড়ে
      for (int i = 0; i < 16; i++) {
        coinPositions[i] = Offset(
          (coinPositions[i].dx + (dice * 5)) % 260,
          (coinPositions[i].dy + (dice * 5)) % 260
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // বোর্ডের বর্ডার ব্ল্যাক
      body: Center(
        child: Container(
          width: 300, height: 300, color: Colors.white,
          child: Stack(children: [
            // ১৬টি গুটিকে স্ক্রিনে প্রদর্শন করা
            ...List.generate(16, (i) => Positioned(
              left: coinPositions[i].dx,
              top: coinPositions[i].dy,
              child: Icon(Icons.circle, color: (i < 4) ? Colors.red : (i < 8) ? Colors.green : (i < 12) ? Colors.yellow : Colors.blue, size: 25),
            )),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: rollDice,
        child: Icon(Icons.casino),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
