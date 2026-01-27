import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/character_bloc.dart';

import '../../services/character_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(CharacterRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        print('object');
                        CharacterService().getCharacters();
                      },
                        child: Image.network("https://rickandmortyapi.com/api/character/avatar/361.jpeg")),
                    Column(

                    ),
                  ],
                ),
              )
            ],

          ),
        ),
      ),

    );
  }
}
