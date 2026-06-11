import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoGameBoardPage()));

class LudoGameBoardPage extends StatefulWidget {
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  // ১৬টি গুটির পজিশন ইনডেক্স (০ থেকে ৩৯ পর্যন্ত মোট ৪০টি ঘর)
  List<int> coinPositions = List.generate(16, (i) => 0); 
  
  // বোর্ডের ৪০টি কোঅর্ডিনেট (বর্গাকার লুপ)
  final List<Offset> boardPath = List.generate(40, (i) {
    if (i < 10) return Offset(20.0 + (i * 25), 20.0); // টপ
    if (i < 20) return Offset(270.0, 20.0 + ((i - 10) * 25)); // রাইট
    if (i < 30) return Offset(270.0 - ((i - 20) * 25), 270.0); // বটম
    return Offset(20.0, 270.0 - ((i - 30) * 25)); // লেফট
  });

  void moveCoins() {
    setState(() {
      int dice = (1 + DateTime.now().microsecond % 6);
      for (int i = 0; i < 16; i++) {
        coinPositions[i] = (coinPositions[i] + dice) % 40; // লুপ অনুযায়ী মুভমেন্ট
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
            ...List.generate(16, (i) => Positioned(
              left: boardPath[coinPositions[i]].dx,
              top: boardPath[coinPositions[i]].dy,
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
