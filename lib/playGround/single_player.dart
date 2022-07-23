import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model.dart';
import 'package:tic_tac_toe/playGround/score_bar.dart';
import 'package:tic_tac_toe/playGround/title_bar.dart';
import 'package:tic_tac_toe/select_mood.dart';

class SinglePlayer extends StatefulWidget {
  static String routeName = 'singlePlayer';

  final bool playerSymbol;
  SinglePlayer({required this.playerSymbol});

  @override
  State<StatefulWidget> createState() {
    return SinglePlayerState();
  }
}

class SinglePlayerState extends State<SinglePlayer> {
  //input
  late bool isPlayerX = widget.playerSymbol;
  //bool isX = false;
  bool isX = Random().nextInt(2) == 0 ? true : false;

  bool play = true;

  int xScore = 0;
  int oScore = 0;

  List<Symbol> positon = [
    //
    Symbol.E, Symbol.E, Symbol.E,
    //
    Symbol.E, Symbol.E, Symbol.E,
    //
    Symbol.E, Symbol.E, Symbol.E,
  ];

  bool get isWin {
    //--------------side
    //top side
    if (positon[0] == positon[1] && positon[1] == positon[2]) {
      if (positon[0] != Symbol.E &&
          positon[1] != Symbol.E &&
          positon[2] != Symbol.E) {
        return true;
      }
    }
    //right side
    if (positon[2] == positon[5] && positon[5] == positon[8]) {
      if (positon[2] != Symbol.E &&
          positon[5] != Symbol.E &&
          positon[8] != Symbol.E) {
        return true;
      }
    }
    //down side
    if (positon[6] == positon[7] && positon[7] == positon[8]) {
      if (positon[6] != Symbol.E &&
          positon[7] != Symbol.E &&
          positon[8] != Symbol.E) {
        return true;
      }
    }
    //left side
    if (positon[0] == positon[3] && positon[3] == positon[6]) {
      if (positon[0] != Symbol.E &&
          positon[3] != Symbol.E &&
          positon[6] != Symbol.E) {
        return true;
      }
    }
    //-------------center
    //top left to down right
    if (positon[0] == positon[4] && positon[4] == positon[8]) {
      if (positon[0] != Symbol.E &&
          positon[4] != Symbol.E &&
          positon[8] != Symbol.E) {
        return true;
      }
    }
    //top right to down left
    if (positon[2] == positon[4] && positon[4] == positon[6]) {
      if (positon[2] != Symbol.E &&
          positon[4] != Symbol.E &&
          positon[6] != Symbol.E) {
        return true;
      }
    }
    //-------------plus
    //vertical
    if (positon[1] == positon[4] && positon[4] == positon[7]) {
      if (positon[1] != Symbol.E &&
          positon[4] != Symbol.E &&
          positon[7] != Symbol.E) {
        return true;
      }
    }
    //horizontal
    if (positon[3] == positon[4] && positon[4] == positon[5]) {
      if (positon[3] != Symbol.E &&
          positon[4] != Symbol.E &&
          positon[5] != Symbol.E) {
        return true;
      }
    }
    //-----------else
    return false;
  }

  bool get isTie {
    return !positon.contains(Symbol.E);
  }

  void singleTap(int i) {
    //isX = !isX;
    print('Set $isX => $i');
    setState(() {
      //set symbol
      if (isX && positon[i] == Symbol.E && !isWin) {
        positon[i] = isPlayerX ? Symbol.X : Symbol.O;
        isX = !isX;
        // AI system
        if (!isX) {
          ai();
        }
      } else if (!isX && positon[i] == Symbol.E && !isWin) {
        positon[i] = isPlayerX ? Symbol.O : Symbol.X;
        isX = !isX;
        // AI system
        if (!isX) {
          ai();
        }
      }
      //winer
      if (isWin && play) {
        if (isPlayerX) {
          isX = !isX;
        }
        if (isX) {
          xScore++;
        } else {
          oScore++;
        }
        play = false;
        if (!isPlayerX) {
          isX = !isX;
        }
        print(isX ? 'X is Winer' : 'O is Winer');
      }
      //tie
      if (isTie) {
        play = false;
        print('Tie');
      }
    });
  }

  void restart() {
    for (int i = 0; i < positon.length; i++) {
      positon[i] = Symbol.E;
    }
    play = true;

    //if AI Win
    if (!isX) {
      var i = Random().nextInt(9);
      singleTap(i);
    }
    if (isTie && !isWin) {
      isX = !isX;
    }
    setState(() {});
  }

  void reset() {
    restart();
    xScore = 0;
    oScore = 0;
    setState(() {});
  }

  void ai() {
    List<int> emptyIndex = [];
    for (int i = 0; i < positon.length; i++) {
      if (positon[i] == Symbol.E) {
        emptyIndex.add(i);
      }
    }
    if (emptyIndex.isNotEmpty) {
      var i = Random().nextInt(emptyIndex.length);
      singleTap(emptyIndex[i]);

      print(emptyIndex);
      print('index $i / value ${emptyIndex[i]}');
    }
  }

  Widget BoxE(int i) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  Widget BoxX(int i) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const FittedBox(
        child: Text(
          'X',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget BoxO(int i) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const FittedBox(
        child: Text(
          'O',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    if (!isX) {
      ai();
    }
  }

//------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text('Single Player'),
      actions: [
        ElevatedButton.icon(
          onPressed: reset,
          onLongPress: restart,
          label: Text(
            'Reset',
            style: TextStyle(
              color: Colors.brown.shade200,
            ),
          ),
          icon: const Icon(
            Icons.clear,
            size: 35,
            color: Colors.pink,
          ),
        ),
      ],
    );

    double screenWidth = MediaQuery.of(context).size.width;

    double sHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            appBar.preferredSize.height +
            screenWidth);

    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Score Bar
          ScoreBar(x: xScore, o: oScore, barHeight: sHeight),
          //playground
          Container(
            width: screenWidth,
            height: screenWidth,
            color: Colors.grey.shade300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                childAspectRatio: 1 / 1,
              ),
              primary: false,
              itemCount: 9,
              itemBuilder: (context, i) {
                //print X on display
                if (positon[i] == Symbol.X) {
                  return GestureDetector(
                    child: BoxX(i),
                    onTap: () => singleTap(i),
                  );
                  //print Y on display
                } else if (positon[i] == Symbol.O) {
                  return GestureDetector(
                    child: BoxO(i),
                    onTap: () => singleTap(i),
                  );
                  //print [blank] on display
                } else {
                  return GestureDetector(
                    child: BoxE(i),
                    onTap: () => singleTap(i),
                  );
                }
              },
            ),
          ),
          //title bar
          TitleBar(
            isX: isPlayerX ? isX : !isX,
            isWin: isWin,
            isTie: isTie,
            fnc: restart,
            barHeight: sHeight,
          ),
        ],
      ),
    );
  }
}
