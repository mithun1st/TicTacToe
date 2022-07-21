import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model.dart';
import 'package:tic_tac_toe/playGround/score_bar.dart';
import 'package:tic_tac_toe/playGround/title_bar.dart';

class MultiPlayer extends StatefulWidget {
  static String routeName = 'multiPlayer';

  @override
  State<StatefulWidget> createState() {
    return MultiPlayerState();
  }
}

class MultiPlayerState extends State<MultiPlayer> {
  int xScore = 0;
  int oScore = 0;

  bool isX = true;

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

  List<Symbol> positon = [
    //
    Symbol.E, Symbol.E, Symbol.E,
    //
    Symbol.E, Symbol.E, Symbol.E,
    //
    Symbol.E, Symbol.E, Symbol.E,
  ];

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

  void singleTap(int i) {
    print('Set $isX => $i');
    setState(() {
      //set symbol
      if (isX && positon[i] == Symbol.E) {
        positon[i] = Symbol.X;
        isX = !isX;
      } else if (!isX && positon[i] == Symbol.E) {
        positon[i] = Symbol.O;
        isX = !isX;
      }
      //winer
      if (isWin) {
        isX = !isX;
        if (isX) {
          xScore++;
        } else {
          oScore++;
        }
        print(isX ? 'X is Winer' : 'O is Winer');
      }
      //tie
      if (isTie) {
        print('-------tie');
      }
    });
  }

  void longTap(int i) {
    setState(() {
      positon[i] = Symbol.E;
    });
    isX = !isX;
  }

  void restart() {
    for (int i = 0; i < positon.length; i++) {
      positon[i] = Symbol.E;
    }
    setState(() {});
  }

  void reset() {
    for (int i = 0; i < positon.length; i++) {
      positon[i] = Symbol.E;
    }
    xScore = 0;
    oScore = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe- Multiplayer'),
        actions: [
          IconButton(
            onPressed: restart,
            icon: const Icon(
              Icons.restart_alt,
              size: 35,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Score Bar
          ScoreBar(x: xScore, o: oScore),
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
                    onLongPress: () => longTap(i),
                  );
                  //print Y on display
                } else if (positon[i] == Symbol.O) {
                  return GestureDetector(
                    child: BoxO(i),
                    onTap: () => singleTap(i),
                    onLongPress: () => longTap(i),
                  );
                  //print [blank] on display
                } else {
                  return GestureDetector(
                    child: BoxE(i),
                    onTap: () => singleTap(i),
                    onLongPress: () => longTap(i),
                  );
                }
              },
            ),
          ),
          //title bar
          TitleBar(
            isX: isX,
            isWin: isWin,
            isTie: isTie,
            fnc: reset,
          ),
        ],
      ),
    );
  }
}
