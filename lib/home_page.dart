import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myTextStyle = TextStyle(fontSize: 30, color: Colors.white);
  bool ohTurn = true; // first player is o;
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  int ohScore = 0;
  int exScore = 0;
  int filledBox = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player O", style: myTextStyle),
                        Text(ohScore.toString(), style: myTextStyle),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player X", style: myTextStyle),
                        Text(exScore.toString(), style: myTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _tapped(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBox += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBox += 1;
      }
      ohTurn = !ohTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    // check the winner
    bool winnerFound = false;
    // checks first row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
      winnerFound = true;
    }

    // checks second row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showDialog(displayExOh[3]);
      winnerFound = true;
    }

    // checks third row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showDialog(displayExOh[6]);
      winnerFound = true;
    }

    // checks first column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
      winnerFound = true;
    }
    // checks second column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showDialog(displayExOh[1]);
      winnerFound = true;
    }
    // checks third column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showDialog(displayExOh[2]);
      winnerFound = true;
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
      winnerFound = true;
    }
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showDialog(displayExOh[6]);
      winnerFound = true;
    } else if (filledBox == 9) {
      _showDrawDialog();
    }
  }

  void _showDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Winner Is: $winner"),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.pop(context);
              },
              child: Text("Play Again!"),
            ),
          ],
        );
      },
    );
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Draw")),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.pop(context);
              },
              child: Text("Play Again!"),
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filledBox = 0;
  }
}
