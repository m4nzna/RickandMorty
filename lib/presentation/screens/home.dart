import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty/blocs/character_bloc.dart';

import '../widgets/character_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<CharacterBloc>().add(CharacterRequested());
  }

  void _onScroll() {
    print(_scrollController.position.maxScrollExtent);

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      print('cargar mas');
      context.read<CharacterBloc>().add(CharacterLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        actions: [
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CharacterBloc>().add(CharacterRequested());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBar(
                leading: Icon(Icons.search),
                hintText: 'Personaje',
                onChanged: (value) {
                  print(value);
                },
                onSubmitted: (value){},
                onTap: (){},
              ),
              SizedBox(height: 16),
              BlocBuilder<CharacterBloc, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CharacterSuccess) {
                    return

                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                          padding: EdgeInsets.all(8.0),
                          itemCount: state.characters.length,
                          itemBuilder: (context, index) {
                            return CharacterItem(
                                character: state.characters[index]);
                          },
                        ),
                      );
                  }else if (state is CharacterFailure){
                    return Container(
                    alignment: Alignment.center,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Text('Error: ${state.message}'),
                    Lottie.asset(
                    'assets/error.json',
                    height: 200,
                    width: 200,
                    ),
                    Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: OutlinedButton(
                    onPressed: () {
                    context.read<CharacterBloc>().add(CharacterRequested());
                    },
                    child: Text('Reintentar'),
                  ),
                  ),
                  ],
                  ),
                  );
                  }
                  return SizedBox.shrink();
                }

              ),

            ],
          ),
        ),
      ),

    );
  }
}
