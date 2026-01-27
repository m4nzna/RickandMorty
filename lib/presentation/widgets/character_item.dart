import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final Result character;

  @override
  Widget build(BuildContext context) {
    return Stack(
alignment: Alignment.center,
      children: [
        Card(
          child:
        Column(
          children: [
            SizedBox(height: 100),
            Text(character.name),
            Text(character.species.name),


          ],
        ),
          ),

          ClipOval(

          child: Image.network(
            character.image,
            fit: BoxFit.cover,
            height: 100,
            width: 100,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
