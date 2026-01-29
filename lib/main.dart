import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home.dart';
import 'package:rick_and_morty/services/character_service.dart';

import 'blocs/character_bloc.dart';
import 'config/theme/theme.dart';
import 'config/theme/util.dart';

void main() {
  final characterService = CharacterService();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CharacterBloc(characterService)),
    ],
    child:
      const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Abel", "Lilita One");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      initialRoute: 'home',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routes: {
        'home': (context) => Home(),
      },
    );
  }
}


