import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0, 1),
              children: [
                Image.asset("assets/img/welcome.png",height: MediaQuery.of(context).size.height * 0.5,),
                Image.asset("assets/img/logo-horizontal.png"),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: const Text(
                'Bienvenid@ a la mejor aplicación sobre juegos, erate de todos los juegos que estan haciendo tendencia en el mundo y diviertete',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            
            ElevatedButton.icon(
              style: ButtonStyle(
              
                backgroundColor:
                    MaterialStateProperty.all<Color?>(primaryColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(const EdgeInsets.all(10)),
              ),
              icon: Image.asset("assets/img/google-svgrepo-com.png",width:35,height: 35,),
              onPressed: () {},
            label: const Text("Iniciar sesión con Google"),
            ),
          ],
        ),
      ),
    );
  }
}