import 'package:flutter/material.dart';
import 'package:tic_tac_toe/select_mood.dart';
import 'package:tic_tac_toe/playGround/multi_player.dart';
import 'package:tic_tac_toe/playGround/single_player.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        toggleableActiveColor: Colors.red,
        //scaffoldBackgroundColor: Colors.cyan.shade100,
      ),
      home: HomePage(),
      routes: {
        //SinglePlayer.routeName: (context) => SinglePlayer(),
        MultiPlayer.routeName: (context) => MultiPlayer(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: SelectMood(),
    );
  }
}
