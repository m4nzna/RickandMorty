import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final Result character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        characterDialog(context, character: character);
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: 150,

                child: Card(
                  color: Theme.of(context).colorScheme.tertiary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80),
                        Text(
                          character.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          CachedNetworkImage(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            imageUrl: character.image,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fadeInDuration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Future<dynamic> characterDialog(
    BuildContext context, {
    required Result character,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  character.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      character.image,
                      fit: BoxFit.cover,
                      loadingBuilder:
                          (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                      errorBuilder:
                          (
                            BuildContext context,
                            Object exception,
                            StackTrace? stackTrace,
                          ) {
                            return Text('Image failed to load');
                          },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Status: ${character.status}'),
                SizedBox(height: 4),
                Text('Species: ${character.species}'),
                SizedBox(height: 4),
                if (character.type.isNotEmpty) Text('Type: ${character.type}'),
                SizedBox(height: 4),
                Text('Gender: ${character.gender}'),
                SizedBox(height: 4),

                const SizedBox(height: 24),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
