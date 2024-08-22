import 'package:flutter/material.dart';
import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/others/constants/my_colors.dart';

class MyCharacter extends StatelessWidget {
  final Character character;

  MyCharacter({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading_image.gif', 
      image: character.image,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    )
      ),
    ),
    footer: Container(
      color: MyColors.backgroundTextImage,
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(4,0,4,4),
      child: Text(
        character.name,
        style: TextStyle(color: MyColors.whiteColor,fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
        ),
    ),
    );
  }
}
