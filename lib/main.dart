class LudoGameBoardPage extends StatefulWidget {
  final String mode;
  LudoGameBoardPage({required this.mode});
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  int dice = 1;
  List<int> coinPositions = [0, 0, 0, 0]; // ৪টি গুটির পজিশন
  int turn = 0; // বর্তমান প্লেয়ারের টার্ন (০ থেকে ৩)

  // পুরো বোর্ডের পথ
  final List<Offset> boardPath = List.generate(40, (i) {
    if (i < 10) return Offset(20 + (i * 20.0), 20); // উপরের লাইন
    if (i < 20) return Offset(220, 20 + ((i - 10) * 20.0)); // ডানদিকের লাইন
    if (i < 30) return Offset(220 - ((i - 20) * 20.0), 220); // নিচের লাইন
    return Offset(20, 220 - ((i - 30) * 20.0)); // বামদিকের লাইন
  });

  void playTurn() {
    setState(() {
      dice = (1 + DateTime.now().microsecond % 6);
      coinPositions[turn] = (coinPositions[turn] + dice) % 40;
      turn = (turn + 1) % 4; // পরবর্তী প্লেয়ারের টার্ন
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.mode), backgroundColor: Colors.brown),
      body: Center(
        child: Container(
          width: 250, height: 250, color: Colors.white,
          child: Stack(children: [
            ...List.generate(4, (i) => Positioned(
              left: boardPath[coinPositions[i]].dx,
              top: boardPath[i].dy,
              child: Icon(Icons.circle, color: [Colors.red, Colors.green, Colors.yellow, Colors.blue][i], size: 25),
            ))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: playTurn,
        label: Text("ROLL & MOVE"),
        icon: Icon(Icons.casino),
      ),
    );
  }
}
