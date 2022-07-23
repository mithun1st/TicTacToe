import 'package:flutter/material.dart';
import 'package:tic_tac_toe/playGround/multi_player.dart';
import 'package:tic_tac_toe/playGround/single_player.dart';

class SelectMood extends StatefulWidget {
  @override
  State<SelectMood> createState() => SelectMoodState();
}

class SelectMoodState extends State<SelectMood> {
  bool playerSymbol = true;
  var rg = 'x';

  void singleP() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SinglePlayer(
        playerSymbol: playerSymbol,
      );
    }));
  }

  void multiP() {
    Navigator.pushNamed(context, MultiPlayer.routeName);
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: sWidth / 1.4,
            child: GestureDetector(
              onTap: () => singleP(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue,
                          Colors.green,
                        ],
                      ),
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.brown.shade50,
                          ),
                          Text(
                            'Single Player',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.black.withOpacity(.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //x
                        Row(
                          children: [
                            const Text(
                              'X',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Radio(
                              value: 'x',
                              groupValue: rg,
                              onChanged: (b) {
                                rg = b.toString();
                                playerSymbol = true;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        //o
                        Row(
                          children: [
                            const Text(
                              'O',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Radio(
                              value: 'o',
                              groupValue: rg,
                              onChanged: (b) {
                                rg = b.toString();
                                playerSymbol = false;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //---------------------
          Container(
            width: sWidth / 1.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
            child: GestureDetector(
              onTap: () => singleP(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.brown.shade50,
                          ),
                          Text(
                            'Multiplayer',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
