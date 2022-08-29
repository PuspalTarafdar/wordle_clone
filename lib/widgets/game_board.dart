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
          width: 64,
          height: 64,
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            
          ),

        )).toList()
        )).toList()
    );
    
  }
}