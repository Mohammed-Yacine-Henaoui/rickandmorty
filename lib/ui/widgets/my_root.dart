import 'package:flutter/material.dart';
import 'package:rickandmorty/others/fonctions/my_theme.dart';
import 'package:rickandmorty/others/fonctions/routes_pages.dart';

class MyRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme(),
        //initialRoute: '/',
        routes: RoutesPages(context));
  }
}
