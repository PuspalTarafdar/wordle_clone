import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wordle_clone/utils/game_provider.dart';

class GameBoard extends StatefulWidget {
  GameBoard(this.game, {Key? key}) : super(key: key);
  WordleGame game;
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.wordleBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: EdgeInsets.all(16),
                          width: 56,
                          height: 56,
                          margin: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: e.code == 0
                            ? Color.fromARGB(255, 82, 82, 82)
                            : e.code ==1
                            ? Colors.green
                            :Color.fromARGB(255, 209, 166, 72),
                          ),
                          child: Center(
                            child: Text(e.letter!, 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              ),),
                          ),
                        ),)
                    .toList(),
              ))
          .toList(),
    );
  }
}
