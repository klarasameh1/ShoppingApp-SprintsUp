import 'package:flutter/material.dart';
import 'package:shopping_app/pages/welcome_page.dart';

void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do App",
        theme: ThemeData(
          focusColor: Colors.black,
          fontFamily: 'Caprasimo-Regular',
        ),
      home: WelcomePage()
    );
  }
}
