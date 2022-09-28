import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';

class CustonDrawer extends StatefulWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  State<CustonDrawer> createState() => _CustonDrawerState();
}

class _CustonDrawerState extends State<CustonDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        children: [
          imageProfile(context),
          
          const ListTile(
            title: Text(
              "Arwen Darly",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              "arwendarly@gmail.com",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14,color: fontColor),
            ),
          ),
          const SizedBox(height: 30),
          const ListTile(
            leading: Icon(Icons.g_translate, color: fontColor),
            title: Text(
              "Idioma",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.important_devices, color: fontColor),
            title: Text(
              "Visitar página oficial",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.assignment, color: fontColor),
            title: Text(
              "Terminos y condiciones",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const Divider(color: fontColor),
          const ListTile(
            leading: Icon(Icons.input, color: fontColor),
            title: Text(
              "Cerrar sesión",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Stack imageProfile(BuildContext context) {
    return Stack(
      alignment: const Alignment(1, 1.8),
      children: [
        topImage(context),
        ClipOval(
          child: Image.asset("assets/img/image-perfil.png"),
        )
      ],
    );
  }

  Stack topImage(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Image.asset("assets/img/drawer-top.png"),
        Image.asset(
          "assets/img/logo-horizontal.png",
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ],
    );
  }
}
