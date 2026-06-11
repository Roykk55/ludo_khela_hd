class LudoGameBoardPage extends StatefulWidget {
  final String mode;
  LudoGameBoardPage({required this.mode});
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  int diceValue = 1;
  // গুটির পজিশন (বোর্ডের ভেতর রাখার জন্য লিমিট করে দিচ্ছি)
  double coinPositionX = 10; 
  double coinPositionY = 10; 

  void rollDice() {
    setState(() {
      diceValue = (1 + DateTime.now().microsecond % 6);
      
      // গুটি যেন বোর্ডের বাইরে না যায়, তার জন্য ক্যালকুলেশন
      // এখানে আমরা গুটির মুভমেন্টকে বোর্ডের ৩২০ পিক্সেলের ভেতরে লক করে দিচ্ছি
      coinPositionX = (coinPositionX + (diceValue * 30)) % 320;
      if (coinPositionX < 10) coinPositionX = 10; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(title: Text("${widget.mode} - Board"), backgroundColor: Colors.black),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 350, width: 350,
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 5)),
              child: Stack(children: [
                Positioned(
                  left: coinPositionX, 
                  top: coinPositionY, 
                  child: Icon(Icons.circle, color: Colors.redAccent, size: 35)
                ),
              ]),
            ),
            SizedBox(height: 30),
            Text("Dice Roll: $diceValue", style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            SizedBox(
              width: 200, height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: rollDice, 
                child: Text("ROLL DICE", style: TextStyle(fontSize: 20, color: Colors.white))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
