import 'package:flutter/material.dart';
import 'package:gamebook/game/widgets/list_games/card_game.dart';
import 'package:gamebook/home/models/game_model.dart';

class ListGameData extends StatefulWidget {
  const ListGameData({Key? key}) : super(key: key);

  @override
  State<ListGameData> createState() => _ListGameDataState();
}

class _ListGameDataState extends State<ListGameData> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: 30,
      padding: const EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index) {
        return CardGame(game: GameModel(
          title:"Diablo Immortal",
          platform: "PC (Windows)",
          freetogameProfileUrl: "https://www.freetogame.com/g/525/thumbnail.jpg"
        ));
      },
    );
  }
}