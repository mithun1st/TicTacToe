import 'package:flutter/material.dart';
import 'package:tic_tac_toe/playGround/multi_player.dart';

class SelectMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: const Text('Single Player'),
            onPressed: () {},
          ),
          ElevatedButton(
            child: const Text('Multiplayer Player'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, MultiPlayer.routeName);
            },
          ),
        ],
      ),
    );
  }
}
