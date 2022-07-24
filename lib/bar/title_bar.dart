import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleBar extends StatelessWidget {
  final bool isX;
  final bool isWin;
  final bool isTie;
  final Function() fnc;
  final double barHeight;

  TitleBar({
    required this.isX,
    required this.isWin,
    required this.isTie,
    required this.fnc,
    required this.barHeight,
  });

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
      return Row(
        children: [
          const Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: FittedBox(
                child: Text(
                  'Match is Tie',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: restart(),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: FittedBox(
          child: Text(
            isX ? 'Your Turn (X)' : 'Your Turn (O)',
            style: const TextStyle(
              color: Color.fromARGB(255, 50, 70, 160),
            ),
          ),
        ),
      );
    }
  }

  Widget restart() {
    return FittedBox(
      child: OutlinedButton.icon(
        onPressed: fnc,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.teal.shade400),
        ),
        label: const Text(
          'Restart',
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
        icon: const Icon(
          Icons.restart_alt,
          color: Colors.pink,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      height: barHeight / 3.2,
      width: double.infinity,
      padding: EdgeInsets.all(4),
      color: Colors.teal,
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
                  child: restart(),
                ),
              ],
            )
          : title(),
    );
  }
}
