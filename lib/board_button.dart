import 'package:flutter/material.dart';

typedef OnPlayerClick = void Function(int);

class BoardButton extends StatelessWidget {
  final String text;
  final int index;
  final OnPlayerClick onPlayerClick;

  const BoardButton(
      {super.key,
      required this.text,
      required this.onPlayerClick,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey.shade200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              side: BorderSide(
                color: Colors.blueGrey,
              )),
          onPressed: () {
            onPlayerClick(index);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
