import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rickandmorty/others/fonctions/my_theme.dart';
import 'package:rickandmorty/others/fonctions/routes_pages.dart';
import 'package:rickandmorty/ui/widgets/loading_indicator.dart';
import 'package:rickandmorty/ui/widgets/no_internet_page.dart';

class CheckInternet extends StatelessWidget {
  const CheckInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InternetConnectionStatus>(
      stream: InternetConnectionChecker().onStatusChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final status = snapshot.data;
          if (status == InternetConnectionStatus.connected) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: myTheme(),
                //initialRoute: '/',
                routes: RoutesPages(context));
          } else {
            return NoInternetPage();
          }
        } else {
          return LoadingIndicator();
        }
      },
    );
  }
}
