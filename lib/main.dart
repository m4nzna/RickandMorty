import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home.dart';
import 'package:rick_and_morty/services/character_service.dart';

import 'blocs/character_bloc.dart';
import 'config/theme/app_theme.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      initialRoute: 'home',
      theme: AppTheme().getTheme(),
      routes: {
        'home': (context) => Home(),
      },
    );
  }
}


