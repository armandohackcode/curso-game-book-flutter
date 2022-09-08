import 'package:flutter/material.dart';
import 'package:gamebook/game/widgets/list_games/list_game_data.dart';
import 'package:gamebook/game/widgets/list_games/list_game_slide.dart';

class ListGameScreen extends StatelessWidget {
  const ListGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          height: 400,
          child: ListGameSlide(),
        ),

        Container(
          padding: EdgeInsets.all(15),
          child: Text("Todos los juegos",style: TextStyle(fontSize:28 ,fontWeight: FontWeight.bold),)),
        const ListGameData(),
      ]),
    );
  }
}