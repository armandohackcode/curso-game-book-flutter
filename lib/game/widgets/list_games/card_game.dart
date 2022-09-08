import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';
import 'package:gamebook/home/models/game_model.dart';

class CardGame extends StatelessWidget {
  final GameModel game;
  final String? alias;
  const CardGame({Key? key, required this.game, this.alias = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Container(
      height: 200,
      alignment: const Alignment(0, 0.9),
      decoration: boxDecoration(),
      child: title(width),
    );
  }

  Row title(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [name(width), platform()],
    );
  }

  Container name(double width) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: width * 0.65,
      child: Text(
        game.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Container platform() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      ),
      child: Text(
        game.platform,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(game.freetogameProfileUrl),
        fit: BoxFit.cover,
      ),
      gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          Colors.black.withOpacity(0.0),
          Colors.black.withOpacity(0.9),
        ],
        stops: const [0.0, 1.0],
      ),
    );
  }
}
