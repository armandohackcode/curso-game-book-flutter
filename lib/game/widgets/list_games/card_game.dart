import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';
import 'package:gamebook/game/screens/detail_game.dart';
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
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      height: 200,
      child: Stack(
        alignment: const Alignment(0,0),
        children: [
          contentImage(width),
          body(context, width),
        ],
      ),
    );
  }

  InkWell body(BuildContext context, double width) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => DetailGame()));
      },
      child: Container(
          alignment: const Alignment(0, 0.9),
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                const Color(0xFF161B22).withOpacity(0.00),
                const Color(0xFF161B22).withOpacity(1.0),
              ],
              stops: const [0.0, 1.0],
            ),
          ),
          child: title(width)),
    );
  }

  Row title(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [name(width), platform(width)],
    );
  }

  Container name(double width) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: width * 0.55,
      child: Text(
        game.title.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Container platform(double width) {
    return Container(
      width: width * 0.33,
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
        image: NetworkImage(game.thumbnail),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget contentImage(double width) {
    return FadeInImage(
      height: 200,
      width: width,
      fit: BoxFit.cover,
      placeholder: const AssetImage("assets/img/placeholder.gif"),
      image: NetworkImage(game.thumbnail),
    );
  }
}
