import 'package:flutter/material.dart';
import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/others/constants/my_colors.dart';

class DetailsCharacter extends StatelessWidget {
  final Character character;

  const DetailsCharacter({super.key, required this.character});

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 450,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(
            color: MyColors.blackColorBody,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        background: Hero(
          tag: character.id,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading_image.gif',
            image: character.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow("Name", character.name),
                      _buildDivider(248),
                      _buildInfoRow("Status", character.status),
                      _buildDivider(240),
                      _buildInfoRow("Species", character.species),
                      _buildDivider(229),
                      _buildInfoRow("Gender", character.gender),
                      _buildDivider(234),
                      SizedBox(height: 300),
                    ]),
              )
            ]),
          )
        ],
      ),
    );
  }
}

Divider _buildDivider(double endIndent) {
  return Divider(
    color: MyColors.motardColor,
    endIndent: endIndent,
    thickness: 2,
  );
}

Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label + " :",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(" " + value),
      ],
    ),
  );
}

/*
Container(
      child: Hero(
        tag: character.id,
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/loading_image.gif',
          image: character.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
    */
