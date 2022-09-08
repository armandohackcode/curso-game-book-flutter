import 'package:flutter/material.dart';
import 'package:gamebook/game/widgets/list_games/card_game.dart';
import 'package:gamebook/home/models/game_model.dart';

class ListGameSlide extends StatefulWidget {
  const ListGameSlide({Key? key}) : super(key: key);

  @override
  State<ListGameSlide> createState() => _ListGameSlideState();
}

class _ListGameSlideState extends State<ListGameSlide> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: 30,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index) {
        return CardGame(game: GameModel(
          title:"Diablo Immortal",
          platform: "PC (Windows)",
          freetogameProfileUrl: "https://www.freetogame.com/g/521/thumbnail.jpg"
        ));
      },
    );
  }
}