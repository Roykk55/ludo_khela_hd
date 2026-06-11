class LudoGameBoardPage extends StatefulWidget {
  final String mode;
  LudoGameBoardPage({required this.mode});
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  int diceValue = 1;
  double coinPosition = 0; // কয়েন মুভমেন্টের পজিশন

  void rollDice() {
    setState(() {
      diceValue = (1 + DateTime.now().microsecond % 6); // ১ থেকে ৬ র‍্যান্ডম নাম্বার
      coinPosition += 20; // প্রতিবার ডাইস রোল হলে কয়েন ২০ ইউনিট আগাবে
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(title: Text("${widget.mode} - Game"), backgroundColor: Colors.black),
      body: Column(
        children: [
          // ধাপ ১: গেম বোর্ড (একটি সিম্পল গ্রিড ডিজাইন)
          Container(
            height: 350, width: 350,
            margin: EdgeInsets.all(20),
            color: Colors.white,
            child: Stack(children: [
              Positioned(left: coinPosition, child: Icon(Icons.circle, color: Colors.red, size: 30)), // কয়েন
            ]),
          ),
          // ধাপ ২: ডাইস রোলিং
          Text("Dice: $diceValue", style: TextStyle(fontSize: 30, color: Colors.white)),
          ElevatedButton(onPressed: rollDice, child: Text("Roll Dice")),
        ],
      ),
    );
  }
}
