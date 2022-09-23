import 'package:flutter/material.dart';
import 'package:gamebook/game/bloc/game_provider.dart';
import 'package:gamebook/game/widgets/list_games/card_game.dart';
import 'package:provider/provider.dart';

class ListGameData extends StatefulWidget {
  const ListGameData({Key? key}) : super(key: key);

  @override
  State<ListGameData> createState() => _ListGameDataState();
}

class _ListGameDataState extends State<ListGameData> {
  /// aqui se crean los datos
  /// este es el incio de todo
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<GameProvider>(context, listen: false);
      if (provider.listGame.isEmpty) {
        provider.getData();
      }
    });
    super.initState();
  }

  /// aqui es donde se destruyen los datos
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return provider.loadingList
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Cargando información.."),
                ),
              ],
            ),
          )
        : RefreshIndicator(
          onRefresh: ()async{
            provider.getData();
          },
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              itemCount: provider.listGame.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (BuildContext context, int index) {
                return CardGame(game: provider.listGame[index]);
              },
            ),
        );
  }
}
