import 'package:flutter/material.dart';
import 'package:gamebook/constants.dart';
import 'package:gamebook/home/screens/sign_in_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const SignInScreen(),
    );
  }
}

