import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';
import 'package:gamebook/game/widgets/list_games/custom_drawer.dart';
import 'package:gamebook/game/widgets/list_games/list_game_data.dart';
import 'package:gamebook/game/widgets/list_games/list_game_slide.dart';

class ListGameScreen extends StatelessWidget {
  const ListGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustonDrawer(),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.33,
            child: const ListGameSlide(),
          ),
      
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15,top:15,bottom: 30),
            child: const Text("Todos los juegos",style: styleTitle)),
          const Expanded(child:  ListGameData()),
        ]),
      ),
    );
  }
}