import 'package:flutter/material.dart';
import 'package:wordle_clone/utils/game_provider.dart';
import 'package:wordle_clone/widgets/game_board.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game,{Key? key}) : super(key: key);
  WordleGame game;

  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["SUBMIT","Z","X","C","V","B","N","M", "DEL"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(WordleGame.game_message,
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: GameBoard(widget.game),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row1.map(
              (e) {
                return InkWell(
                  onTap: () {
                    print(e);
                    if(widget.game.letterId < 5 ){
                      setState(() {
                        widget.game.insertWord(widget.game.letterId, Letter(e,0));
                        widget.game.letterId++;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 227, 227, 227),
                    ),
                    child: Text(
                      "${e}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row2.map(
              (e) {
                return InkWell(
                  onTap: () {
                    print(e);
                    if(widget.game.letterId < 5 ){
                      setState(() {
                        widget.game.insertWord(widget.game.letterId, Letter(e,0));
                        widget.game.letterId++;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 227, 227, 227),
                    ),
                    child: Text(
                      "${e}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row3.map(
              (e) {
                return InkWell(
                  onTap: () {
                    
                    if(e =="DEL"){
                      if(widget.game.letterId > 0){
                        setState(() {
                          widget.game.insertWord(widget.game.letterId-1, Letter("",0));
                          widget.game.letterId--;
                        });
                      }

                    }
                    else if(e=="SUBMIT"){
                      if(widget.game.letterId >=5){
                        String guess = widget.game.wordleBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                        if(widget.game.checkWordExist(guess)){
                          if(guess == WordleGame.game_guess){
                            setState(() {
                              WordleGame.game_message = "Congratulations 🎊";
                              widget.game.wordleBoard[widget.game.rowId]
                              .forEach((element) {
                                element.code = 1;
                              });
                            });
                          }else{
                            int listLength = guess.length;
                            for(int i=0; i<listLength;i++){
                              String char = guess[i];
                              if(WordleGame.game_guess.contains(char)){
                                if(WordleGame.game_guess[i]==char){
                                  setState(() {
                                    widget.game.wordleBoard[widget.game.rowId][i].code=1;
                                  });
                                }else{
                                  setState(() {
                                    widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 2;
                                  });
                                }
                              }
                            }
                            widget.game.rowId++;
                            widget.game.letterId = 0;
                          }
                        }
                        else{
                          WordleGame.game_message = "The word does not exist, try again";
                        }
                      }

                    }
                    else{
                      if(widget.game.letterId < 5 ){
                      setState(() {
                        widget.game.insertWord(widget.game.letterId, Letter(e,0));
                        widget.game.letterId++;
                      });
                    }

                    }
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 227, 227, 227),
                    ),
                    child: Text(
                      "$e",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        )

      ],
    );
  }
}
