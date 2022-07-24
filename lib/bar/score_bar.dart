import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScoreBar extends StatelessWidget {
  final int x;
  final int o;
  final double barHeight;

  double? percent;

  ScoreBar({
    required this.x,
    required this.o,
    required this.barHeight,
  }) {
    if (x == 0 && o == 0) {
      percent = .5;
    } else {
      percent = (x / (x + o));
    }
    print('score: $percent');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight / 2.5,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //
                  Container(
                    height: double.infinity,
                    child: const FittedBox(
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
                  Container(
                    padding: EdgeInsets.all(4),
                    height: double.infinity,
                    child: FittedBox(
                      child: Text(
                        '$x\t:\t$o',
                      ),
                    ),
                  ),
                  //
                  Container(
                    height: double.infinity,
                    child: const FittedBox(
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
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              color: Colors.green,
              child: FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: percent,
                heightFactor: 1,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
