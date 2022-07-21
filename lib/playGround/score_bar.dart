import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScoreBar extends StatelessWidget {
  final int x;
  final int o;

  ScoreBar({required this.x, required this.o});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      height: heightScreen / 11,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: FittedBox(
              child: Text(
                'Player\nX',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          //
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: FittedBox(
              child: Text(
                '$x\t:\t$o',
              ),
            ),
          ),
          //
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: FittedBox(
              child: Text(
                'Player\nO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
