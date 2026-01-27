import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final Result character;

  @override
  Widget build(BuildContext context) {
    return Stack(
alignment: Alignment.topCenter,
      children: [

        Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: 150,

              child:
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(height: 80),
                    Text(character.name),
                    Text(character.species.name),


                  ],
                ),
              ),
            ),
              ),
          ],
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
