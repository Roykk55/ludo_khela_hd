import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoGameBoardPage()));

class LudoGameBoardPage extends StatefulWidget {
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  // ১৬টি গুটির পজিশন এবং রঙ
  List<Color> colors = [
    ...List.generate(4, (_) => Colors.red),
    ...List.generate(4, (_) => Colors.green),
    ...List.generate(4, (_) => Colors.yellow),
    ...List.generate(4, (_) => Colors.blue),
  ];
  
  List<double> coinX = List.generate(16, (i) => 20.0 + (i % 4) * 20);
  List<double> coinY = List.generate(16, (i) => 20.0 + (i ~/ 4) * 20);

  void rollDice() {
    setState(() {
      int dice = (1 + DateTime.now().microsecond % 6);
      for (int i = 0; i < 16; i++) {
        coinX[i] = (coinX[i] + (dice * 10)) % 280;
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
            // ৪টি কালার জোন (লাল, সবুজ, হলুদ, নীল)
            Positioned(top: 0, left: 0, child: Container(width: 150, height: 150, color: Colors.red.withOpacity(0.3))),
            Positioned(top: 0, right: 0, child: Container(width: 150, height: 150, color: Colors.green.withOpacity(0.3))),
            Positioned(bottom: 0, left: 0, child: Container(width: 150, height: 150, color: Colors.yellow.withOpacity(0.3))),
            Positioned(bottom: 0, right: 0, child: Container(width: 150, height: 150, color: Colors.blue.withOpacity(0.3))),
            
            // ১৬টি গুটি
            ...List.generate(16, (i) => Positioned(
              left: coinX[i], top: coinY[i],
              child: Icon(Icons.circle, color: colors[i], size: 20),
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
