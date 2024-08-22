import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/controller/cubits/getCharacters/get_characters_cubit.dart';

class RetryGetCharacters extends StatelessWidget {
  // Constructor (optional, add if needed)
  const RetryGetCharacters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          BlocProvider.of<GetCharactersCubit>(context).getCharacters();
        },
        label: const Text("Retry"),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
