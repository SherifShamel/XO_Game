import 'package:flutter/material.dart';
import 'package:xo_game/Board_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = "Welcome";

  WelcomeScreen({super.key});

  late String playerOne;
  late String playerTwo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome to X_O Game",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                playerOne = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter Player One Name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                playerTwo = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter Player Two Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    BoardScreen.routeName,
                    arguments:
                        PlayersName(playerOne: playerOne, playerTwo: playerTwo),
                  );
                },
                child: const Text(
                  "Start Play",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayersName {
  final String playerOne;
  final String playerTwo;

  PlayersName({required this.playerOne, required this.playerTwo});
}
