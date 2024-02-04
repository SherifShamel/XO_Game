import 'package:flutter/material.dart';
import 'package:xo_game/board_button.dart';
import 'package:xo_game/welcome_Screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  static const String routeName = "BoardScreen";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int playerOneScore = 0;
  int playerTwoScore = 0;
  List<String> boardState = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as PlayersName;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "X_O Game",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          // Players Stage
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "${args.playerOne} (X)",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Text("Score: $playerOneScore",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w300)),
                  ],
                ),
                Column(
                  children: [
                    Text("${args.playerTwo} (O)",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    Text("Score: $playerTwoScore",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w300)),
                  ],
                ),
              ],
            ),
          ),

          //XO Stage
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[0],
                    onPlayerClick: onPlayerClick,
                    index: 0),
                BoardButton(
                    text: boardState[1],
                    onPlayerClick: onPlayerClick,
                    index: 1),
                BoardButton(
                    text: boardState[2],
                    onPlayerClick: onPlayerClick,
                    index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[3],
                    onPlayerClick: onPlayerClick,
                    index: 3),
                BoardButton(
                    text: boardState[4],
                    onPlayerClick: onPlayerClick,
                    index: 4),
                BoardButton(
                    text: boardState[5],
                    onPlayerClick: onPlayerClick,
                    index: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[6],
                    onPlayerClick: onPlayerClick,
                    index: 6),
                BoardButton(
                    text: boardState[7],
                    onPlayerClick: onPlayerClick,
                    index: 7),
                BoardButton(
                    text: boardState[8],
                    onPlayerClick: onPlayerClick,
                    index: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onPlayerClick(int index) {
    setState(() {
      print("On Player Click $index");
      if (boardState[index].isNotEmpty) {
        return;
      }
      if (counter.isEven) {
        boardState[index] = "X";
        checkWinner("X");
      } else {
        boardState[index] = "O";
        checkWinner("O");
      }
      counter++;

      if (checkWinner("X")) {
        playerOneScore++;
        clearBoard();
      } else if (checkWinner("O")) {
        playerTwoScore++;
        clearBoard();
      } else if (counter == 9) {
        clearBoard();
      }
    });
  }

  bool checkWinner(String playerSymbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == playerSymbol &&
          boardState[i + 1] == playerSymbol &&
          boardState[i + 2] == playerSymbol) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (boardState[i] == playerSymbol &&
          boardState[i + 3] == playerSymbol &&
          boardState[i + 6] == playerSymbol) {
        return true;
      }
    }
    if (boardState[0] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[8] == playerSymbol) {
      return true;
    }
    if (boardState[2] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[6] == playerSymbol) {
      return true;
    }

    return false;
  }

  void clearBoard() {
    boardState = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }
}
