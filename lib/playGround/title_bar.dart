import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleBar extends StatelessWidget {
  final bool isX;
  final bool isWin;
  final bool isTie;
  final Function() fnc;

  TitleBar(
      {required this.isX,
      required this.isWin,
      required this.isTie,
      required this.fnc});

  Widget title() {
    if (isWin) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            isX ? 'Winner is : X!' : 'Winner is : O !',
            style: const TextStyle(
              color: Colors.yellow,
            ),
          ),
        ),
      );
    }

    //tie
    else if (isTie) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            'Match is Tie',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: FittedBox(
          child: Text(
            isX ? 'Your Turn (X)' : 'Your Turn (O)',
            style: const TextStyle(
              color: Colors.indigo,
            ),
          ),
        ),
      );
    }
  }

  Widget reset() {
    return FittedBox(
      child: OutlinedButton.icon(
        onPressed: fnc,
        label: const Text('Reset Scores'),
        icon: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      height: heightScreen / 12,
      width: double.infinity,
      color: Colors.cyan,
      child: isWin
          ? Row(
              children: [
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: title(),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: reset(),
                ),
              ],
            )
          : title(),
    );
  }
}
