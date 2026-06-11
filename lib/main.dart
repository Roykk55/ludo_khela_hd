import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LudoBoardFinal()));

class LudoBoardFinal extends StatefulWidget {
  @override
  _LudoBoardFinalState createState() => _LudoBoardFinalState();
}

class _LudoBoardFinalState extends State<LudoBoardFinal> {
  // গুটির পজিশন - ৪টি রঙের জন্য ১৬টি গুটি
  List<Offset> positions = List.generate(16, (i) => Offset(20, 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 320, height: 320, color: Colors.white,
          child: Stack(children: [
            // ১. সুন্দর বোর্ড ডিজাইন (৪টি কালার জোন)
            Positioned(top: 0, left: 0, child: Container(width: 160, height: 160, color: Colors.red.withOpacity(0.3))),
            Positioned(top: 0, right: 0, child: Container(width: 160, height: 160, color: Colors.green.withOpacity(0.3))),
            Positioned(bottom: 0, left: 0, child: Container(width: 160, height: 160, color: Colors.yellow.withOpacity(0.3))),
            Positioned(bottom: 0, right: 0, child: Container(width: 160, height: 160, color: Colors.blue.withOpacity(0.3))),
            
            // ২. গ্রিড লাইন বা বর্ডার (ডিজাইন আরও প্রফেশনাল করার জন্য)
            CustomPaint(painter: BoardPainter()),

            // ৩. ১৬টি গুটি (এনিমেশনসহ)
            ...List.generate(16, (i) => AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: positions[i].dx,
              top: positions[i].dy,
              child: Icon(Icons.circle, color: (i < 4) ? Colors.red : (i < 8) ? Colors.green : (i < 12) ? Colors.yellow : Colors.blue, size: 24),
            )),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // এখানে ক্লিক করলে গুটিগুলো বোর্ডের নির্দিষ্ট রাউন্ড পথে ঘুরবে
            positions = List.generate(16, (i) => Offset(40.0 + (i * 10) % 200, 40.0 + (i * 10) % 200));
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// বোর্ডের দাগগুলো আঁকার জন্য
class BoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black..strokeWidth = 2;
    canvas.drawLine(Offset(160, 0), Offset(160, 320), paint);
    canvas.drawLine(Offset(0, 160), Offset(320, 160), paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
