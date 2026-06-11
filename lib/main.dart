// Enhanced Game Board with proper Pathing and Layout
class LudoGameBoardPage extends StatefulWidget {
  final String mode;
  LudoGameBoardPage({required this.mode});
  @override
  _LudoGameBoardPageState createState() => _LudoGameBoardPageState();
}

class _LudoGameBoardPageState extends State<LudoGameBoardPage> {
  // --- Game State ---
  int diceValue = 1;
  int currentTurn = 0; // Index of the player whose turn it is (0:R, 1:G, 2:Y, 3:B)
  bool canRollDice = true;
  bool diceRolledForTurn = false;

  // --- Path & Coin Setup ---
  // A Ludo board has 52 standard common cells, plus start/finish zones.
  // The grid is conceptualized here for illustrative movement.
  // We define key offsets in a simplified conceptual grid to show sequential flow.
  final List<Offset> fullBoardPath = [
    // Red Base conceptual start -> Common path (simplified for sequential demo)
    Offset(40, 140), Offset(60, 140), Offset(80, 140), Offset(100, 140), Offset(120, 140), // Red Safe Zone Exit
    Offset(140, 120), Offset(140, 100), Offset(140, 80), Offset(140, 60), Offset(140, 40), Offset(140, 20), // Top Vertical
    Offset(160, 0),   Offset(180, 0), // Top Bend
    Offset(200, 20), Offset(200, 40), Offset(200, 60), Offset(200, 80), Offset(200, 100), Offset(200, 120), // Middle Vertical Down
    Offset(220, 140), Offset(240, 140), Offset(260, 140), Offset(280, 140), Offset(300, 140), // Right Horiz
    Offset(320, 160), Offset(320, 180), // Right Bend
    Offset(300, 200), Offset(280, 200), Offset(260, 200), Offset(240, 200), Offset(220, 200), // Middle Horiz Left
    Offset(200, 220), Offset(200, 240), Offset(200, 260), Offset(200, 280), Offset(200, 300), Offset(200, 320), // Bottom Vertical
    Offset(180, 340), Offset(160, 340), // Bottom Bend
    Offset(140, 320), Offset(140, 300), Offset(140, 280), Offset(140, 260), Offset(140, 240), Offset(140, 220), // Middle Vertical Up
    Offset(120, 200), Offset(100, 200), Offset(80, 200), Offset(100, 200), Offset(40, 200), // Left Horiz
    Offset(20, 180), Offset(0, 180), // Left Bend
    Offset(0, 160), // Path back to Red Corner Conceptual start
    // In a real game, each player has a different start point and home path.
    // This is a simplified single-path loop for illustrative movement.
  ];

  // Coin indices on the fullBoardPath. One per color.
  List<int> coinPathIndices = [0, 0, 0, 0]; // Index on boardPath for [R, G, Y, B]
  List<Color> coinColors = [Colors.red, Colors.green, Colors.yellow, Colors.blue];
  List<String> playerNames = ["Red", "Green", "Yellow", "Blue"];

  void rollDice() {
    if (!canRollDice || diceRolledForTurn) return; // Must move current coin before rolling again
    setState(() {
      diceValue = (1 + DateTime.now().microsecond % 6);
      diceRolledForTurn = true;
      canRollDice = false; // Disable dice until a move is made
    });
    // In a real Ludo, you'd check if any move is possible and maybe auto-move.
    // For now, require manual coin tap.
  }

  void moveCoin(int coinIndex) {
    if (!diceRolledForTurn || canRollDice || coinIndex != currentTurn) return; // Must move *after* dice, and only current player
    
    int spacesToMove = diceValue;
    int currentIndex = coinPathIndices[coinIndex];
    int nextIndex = (currentIndex + spacesToMove); // Simplified infinite loop path

    // Optional: Home path logic would go here. We'll just loop for simplicity.
    if (nextIndex >= fullBoardPath.length) {
       // In a simplified loop, if you surpass, you reset to base/safe path start conceptual start.
       // Here we'll just conceptually 'win' and reset index to -1 or something similar.
       // But for illustrative looping, we'll just loop:
       nextIndex = nextIndex % fullBoardPath.length;
    }

    setState(() {
      coinPathIndices[coinIndex] = nextIndex;
      diceRolledForTurn = false; // Dice roll has been 'consumed'
      canRollDice = true; // Player must end turn and next player rolls
      // Turn ending logic would go here, allowing user to manually end turn or auto-end.
      // For simplicity, let's keep it the current player's action to end turn.
    });
  }

  void endTurn() {
    if (!diceRolledForTurn && canRollDice) { // Valid time to end turn
      setState(() {
        currentTurn = (currentTurn + 1) % 4; // Cycle 0-3
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: Text("${widget.mode} - Arena"), backgroundColor: Colors.brown[900]),
      body: Center(
        child: Column(children: [
          SizedBox(height: 10),
          // --- Refined Ludo Board Grid & Design ---
          Container(
            height: 350, width: 350,
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 2)),
            child: Stack(children: [
              // 1. Red Base (Top Left)
              Positioned(top: 10, left: 10, child: Container(width: 120, height: 120, decoration: BoxDecoration(color: Colors.red.withOpacity(0.3), border: Border.all(color: Colors.black, width: 1.5)))),
              // 2. Green Base (Top Right)
              Positioned(top: 10, right: 10, child: Container(width: 120, height: 120, decoration: BoxDecoration(color: Colors.green.withOpacity(0.3), border: Border.all(color: Colors.black, width: 1.5)))),
              // 3. Yellow Base (Bottom Left)
              Positioned(bottom: 10, left: 10, child: Container(width: 120, height: 120, decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.3), border: Border.all(color: Colors.black, width: 1.5)))),
              // 4. Blue Base (Bottom Right)
              Positioned(bottom: 10, right: 10, child: Container(width: 120, height: 120, decoration: BoxDecoration(color: Colors.blue.withOpacity(0.3), border: Border.all(color: Colors.black, width: 1.5)))),
              
              // 5. Grid Path Lines & Safe Zones (Illustrative simplified grid)
              ..._buildIllustrativeGridLines(),

              // 6. Common Path Cells Safe Zones & Starting Squares
              // Conceptual Safe/Starting Zone markers for illustrative purposes. Real grid would have specific cell rules.
              Positioned(top: 125, left: 25, child: _buildSafeZoneMarker(Colors.red)), // Illustrative starting cell conceptual area
              Positioned(top: 25, right: 125, child: _buildSafeZoneMarker(Colors.green)), // Illustrative starting cell conceptual area
              Positioned(bottom: 125, right: 25, child: _buildSafeZoneMarker(Colors.blue)), // Illustrative starting cell conceptual area
              Positioned(bottom: 25, left: 125, child: _buildSafeZoneMarker(Colors.yellow)), // Illustrative starting cell conceptual area

              // Home Zone Area (Center square)
              Positioned(top: 130, left: 130, child: Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 2)), child: Center(child: Text("HOME")))),

              // 7. Interactive Coins that move along the FullBoardPath
              ...List.generate(4, (index) {
                int pathIdx = coinPathIndices[index];
                Offset coinOffset = fullBoardPath[pathIdx]; // Move along the defined path
                bool isCurrentTurnPlayer = (index == currentTurn);

                return Positioned(
                  left: coinOffset.dx + 5, // Center slightly within illustrative grid spacing
                  top: coinOffset.dy + 5,
                  child: GestureDetector(
                    onTap: () => moveCoin(index), // Can only move the current turn's coin
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: coinColors[index],
                        border: isCurrentTurnPlayer ? Border.all(color: Colors.white, width: 3) : Border.all(color: Colors.black, width: 1), // Highlight current coin
                        boxShadow: isCurrentTurnPlayer ? [BoxShadow(color: Colors.white, blurRadius: 10)] : [],
                      ),
                      width: 30, height: 30, // Defined size for sequential flow demonstration
                      child: Center(child: Icon(Icons.circle, color: Colors.white.withOpacity(0.5), size: 12)),
                    ),
                  ),
                );
              }),
            ]),
          ),
          Spacer(),
          // Game Status Area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                 Text("${playerNames[currentTurn]}'s Turn", style: TextStyle(fontSize: 24, color: coinColors[currentTurn], fontWeight: FontWeight.bold)),
                 if (diceRolledForTurn && !canRollDice) Text("Move Coin", style: TextStyle(fontSize: 16, color: Colors.white70)),
                 if (!diceRolledForTurn && canRollDice) Text("Roll Dice or End Turn", style: TextStyle(fontSize: 16, color: Colors.white70)),
              ]),
              Spacer(),
              Text("$diceValue", style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold)),
            ]),
          ),
          SizedBox(height: 10),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160, height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: canRollDice && !diceRolledForTurn ? Colors.orange : Colors.grey[700]),
                    onPressed: canRollDice && !diceRolledForTurn ? rollDice : null, // Disable until move is made
                    child: Text("ROLL DICE", style: TextStyle(fontSize: 22, color: Colors.white))
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 160, height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: !diceRolledForTurn && canRollDice ? Colors.grey[800] : Colors.grey[700]),
                    onPressed: !diceRolledForTurn && canRollDice ? endTurn : null,
                    child: Text("END TURN", style: TextStyle(fontSize: 22, color: Colors.white))
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }

  // --- Helper Builders ---
  List<Widget> _buildIllustrativeGridLines() {
    return [
      // Illustrative conceptual grid line drawing (not exact Ludo cell count, but a structured layout).
      Positioned(top: 130, left: 10, child: Container(width: 330, height: 1, color: Colors.black26)), // Mid Horiz line
      Positioned(top: 220, left: 10, child: Container(width: 330, height: 1, color: Colors.black26)), // Mid Horiz line
      Positioned(top: 10, left: 130, child: Container(width: 1, height: 330, color: Colors.black26)), // Mid Vertical line
      Positioned(top: 10, left: 220, child: Container(width: 1, height: 330, color: Colors.black26)), // Mid Vertical line
    ];
  }

  Widget _buildSafeZoneMarker(Color baseColor) {
    // Basic conceptual placeholder for a safe cell / starting cell marker.
    return Container(
      width: 20, height: 20,
      decoration: BoxDecoration(color: baseColor.withOpacity(0.2), shape: BoxShape.rectangle, border: Border.all(color: Colors.black, width: 0.5)),
    );
  }
}
