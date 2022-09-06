import 'package:flutter/material.dart';
import 'package:gamebook/home/models/game_model.dart';

class CardGame extends StatelessWidget {
  final GameModel game;
  final String? alias;
  const CardGame({Key? key, required this.game, this.alias = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(game.freetogameProfileUrl), fit: BoxFit.cover),
      ),
      child: Text(game.title),
    );
  }
}
