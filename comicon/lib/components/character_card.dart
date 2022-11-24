import 'package:comicon/models/char_model.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  CharacterCard({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image(
            image: NetworkImage(character.thumbnail),
          ),
          Text(character.name),
        ],
      ),
    );
  }
}

    // List<Character> chars =
    //     characters.map((e) => Character.fromJson(e)).toList();
