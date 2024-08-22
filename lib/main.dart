

import 'package:flutter/material.dart';
import 'package:rickandmorty/ui/widgets/my_bloc_provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBlocProvider();
  }
}
