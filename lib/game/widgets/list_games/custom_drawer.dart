import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gamebook/constants.dart';
import 'package:gamebook/home/bloc/sign_in_social_network.dart';
import 'package:provider/provider.dart';

class CustonDrawer extends StatefulWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  State<CustonDrawer> createState() => _CustonDrawerState();
}

class _CustonDrawerState extends State<CustonDrawer> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<SignInSocialNetworkProvider>(context);
    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        children: [
          
          imageProfile(context,
              photoUrl:
                  auth.userInfo.photoURL ),
                  
          SizedBox(
            width: 100,
            child: ListTile(
              title: Text(
                
                auth.userInfo.displayName ?? "Anónimo",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                auth.userInfo.email ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: fontColor),
              ),
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
           ListTile(
            leading: const Icon(Icons.input, color: fontColor),
            onTap: ()async{
              await auth.logOut();
              Phoenix.rebirth(context);
            },
            title: const Text(
              "Cerrar sesión",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Stack imageProfile(BuildContext context,
      {String? photoUrl}) {
    return Stack(
      alignment: const Alignment(1, 1.3),
      children: [
        topImage(context),
        // ClipOval(
        //   child: (photoUrl!=null)?
        //   Image.network(photoUrl):Image.asset("assets/img/image-perfil.png"),
        // )
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
