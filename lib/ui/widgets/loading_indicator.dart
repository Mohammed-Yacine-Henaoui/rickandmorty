import 'package:flutter/material.dart';
import 'package:rickandmorty/others/constants/my_colors.dart';

class LoadingIndicator extends StatelessWidget {
  // Constructor (optional, add if you need to pass parameters)
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.backgroundScreen,
      child: Center(
      child: Image.asset(
        "assets/images/loading.gif",
        width: 120,
        height: 120,
      )
    ),
    );
  }
}
