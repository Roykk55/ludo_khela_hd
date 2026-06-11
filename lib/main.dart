import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoGameBoardPage()));

class LudoGameBoardPage extends StatefulWidget {
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  // গুটির প্রাথমিক পজিশন
  double coinX = 50;
  double coinY = 50;

  void moveCoin() {
    setState(() {
      // খুব সিম্পল লজিক: গুটিটি চার কোণায় ঘুরবে
      if (coinX < 200 && coinY == 50) coinX += 50;
      else if (coinX >= 200 && coinY < 200) coinY += 50;
      else if (coinX > 50 && coinY >= 200) coinX -= 50;
      else coinY -= 50;
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
            Positioned(left: coinX, top: coinY, child: Icon(Icons.circle, color: Colors.red, size: 40)),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: moveCoin, child: Icon(Icons.play_arrow)),
    );
  }
}
