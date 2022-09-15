import 'package:flutter/material.dart';
import 'package:gamebook/game/widgets/list_games/list_game_data.dart';
import 'package:gamebook/game/widgets/list_games/list_game_slide.dart';

class ListGameScreen extends StatelessWidget {
  const ListGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height*0.33,
            child: const ListGameSlide(),
          ),
      
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text("Todos los juegos",style: TextStyle(fontSize:28 ,fontWeight: FontWeight.bold),)),
          const ListGameData(),
        ]),
      ),
    );
  }
}