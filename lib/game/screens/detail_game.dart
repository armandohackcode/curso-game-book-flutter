import 'package:flutter/material.dart';
import 'package:gamebook/game/bloc/game_provider.dart';
import 'package:gamebook/game/widgets/detail_game/modal_show_image.dart';
import 'package:provider/provider.dart';

class DetailGame extends StatefulWidget {
  const DetailGame({Key? key}) : super(key: key);

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return Scaffold(
      body: provider.loadingDetail
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(10),
              children: [
                image(provider),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Text(
                      provider.info!.title,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      provider.info!.description,
                      style: const TextStyle(fontSize: 16),
                    )),
                rowInfo("Desarrollado por:", provider.info!.developer),
                rowInfo("Publicado por:", provider.info!.publisher),
                rowInfo("Genero:", provider.info!.genre),
                rowInfo("Plataforma:", provider.info!.platform),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15, bottom: 30),
                  child: const Text(
                    "Requerimiento mínimos :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                rowInfo("Sistema Operativo",
                    provider.info!.minimumSystemRequirements!.os),
                rowInfo("Procesador",
                    provider.info!.minimumSystemRequirements!.processor),
                rowInfo("Memoria",
                    provider.info!.minimumSystemRequirements!.memory),
                rowInfo("Gráficos",
                    provider.info!.minimumSystemRequirements!.graphics),
                rowInfo("Almacenamiento",
                    provider.info!.minimumSystemRequirements!.storage),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: provider.info!.screenshots.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => ModalShowImage(
                                imageUrl:
                                    provider.info!.screenshots[index].image));
                      },
                      child: FadeInImage(
                        // height: 200,
                        // width: width,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage("assets/img/placeholder.gif"),
                        image: NetworkImage(
                            provider.info!.screenshots[index].image),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
    );
  }

  Widget rowInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.45,
              //
              child: Text(
                label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.all(0),
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Container image(GameProvider provider) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      height: 200,
      child: Stack(
        alignment: const Alignment(0, 0),
        children: [
          contentImage(provider.info!.thumbnail),
          body(),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
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
    );
  }

  Widget contentImage(String image) {
    return FadeInImage(
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      placeholder: const AssetImage("assets/img/placeholder.gif"),
      image: NetworkImage(image),
    );
  }
}
