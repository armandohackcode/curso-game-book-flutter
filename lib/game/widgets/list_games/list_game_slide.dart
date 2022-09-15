import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';
import 'package:gamebook/game/widgets/list_games/card_game.dart';
import 'package:gamebook/home/models/game_model.dart';

class ListGameSlide extends StatefulWidget {
  const ListGameSlide({Key? key}) : super(key: key);

  @override
  State<ListGameSlide> createState() => _ListGameSlideState();
}

class _ListGameSlideState extends State<ListGameSlide> {
  List<String> listImage = [
    "https://www.freetogame.com/g/516/thumbnail.jpg",
    "https://www.freetogame.com/g/508/thumbnail.jpg",
    "https://www.freetogame.com/g/345/thumbnail.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        disableCenter: true,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
      ),
      items: listImage
          .map((item) => bodySlide(
              imageUrl: item,
              title: "Titulo",
              detail: " descripcion varios.........................."))
          .toList(),
    ));
  }

  Container bodySlide(
      {required String title, String detail = "", required String imageUrl}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: boxDecoration(imageUrl),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              const Color(0xFF161B22).withOpacity(0.00),
              
              const Color(0xFF161B22).withOpacity(1.0),
            ],
            stops: const [0.1,1.0,],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(detail),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor
                  ),
                  child: const Text("Ver más"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecoration(String image) {
    return BoxDecoration(
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.contain,centerSlice:Rect.largest,scale: 1.35, ),
    );
  }
}
