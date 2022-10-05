import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';
import 'package:gamebook/game/bloc/game_provider.dart';
import 'package:gamebook/game/screens/list_games_screen.dart';
import 'package:gamebook/home/bloc/sign_in_social_network.dart';
import 'package:gamebook/home/screens/sign_in_screen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameProvider()),
        ChangeNotifierProvider(
            create: (context) => SignInSocialNetworkProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: Typography.blackRedmond.apply(
              bodyColor: fontColor,
              fontFamily: 'Lato',
            )),
        home: const ValidateToken(),
      ),
    );
  }
}

class ValidateToken extends StatefulWidget {
  const ValidateToken({Key? key}) : super(key: key);

  @override
  State<ValidateToken> createState() => _ValidateTokenState();
}

class _ValidateTokenState extends State<ValidateToken> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var authProvider =
          Provider.of<SignInSocialNetworkProvider>(context, listen: false);

      authProvider.validateToken();
    });
    super.initState();
  }

  Widget showLoading() => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/logo-horizontal.png",
              width: 300,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<SignInSocialNetworkProvider>(context);
    if (authProvider.loadingValidate) {
      return showLoading();
    } else {
      if (authProvider.isAuth) {
        return const ListGameScreen();
      } else {
        return const SignInScreen();
      }
    }
  }
}
