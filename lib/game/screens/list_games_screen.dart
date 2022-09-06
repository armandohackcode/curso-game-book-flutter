import 'package:flutter/material.dart';
import 'package:gamebook/game/widgets/list_games/list_game_data.dart';

class ListGameScreen extends StatelessWidget {
  const ListGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const ListGameData(),
      ]),
    );
  }
}