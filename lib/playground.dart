import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PlayGround extends StatefulWidget {
  final double? screenWidth;

  PlayGround(this.screenWidth);

  @override
  State<StatefulWidget> createState() {
    return PlayGroundState();
  }
}

class PlayGroundState extends State<PlayGround> {
  int j = 10;
  Widget Box(int i) {
    return GestureDetector(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      onTap: () => fnc(i),
    );
  }

  void fnc(int i) {
    j = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.screenWidth,
        height: widget.screenWidth,
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
            if (i == j) {
              return Container(
                color: Colors.amber,
              );
            } else
              return GestureDetector(
                onTap: () => print(i),
                child: Box(i),
              );
          },
        ),
      ),
    );
  }
}
