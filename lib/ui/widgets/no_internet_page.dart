import 'package:flutter/material.dart';
import 'package:rickandmorty/others/constants/my_colors.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.backgroundScreen,
      child: Center(
      child: Center(
        child: Image.asset("assets/images/no_internet.jpg"),
      ),),
    );
  }
}
