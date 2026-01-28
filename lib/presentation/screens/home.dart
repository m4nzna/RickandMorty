import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty/blocs/character_bloc.dart';

import '../widgets/character_item.dart';

enum StatusCharacter { alive, dead, unknown }

enum GenderCharacter { female, male, genderless, unknown }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollController;

  Timer? _debounce;

  void onSearchNameChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<CharacterBloc>().add(CharacterRequested(name: value));
    });
  }

  void onSearchSpeciesChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<CharacterBloc>().add(CharacterRequested(species: value));
    });
  }

  void onSearchTypeChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<CharacterBloc>().add(CharacterRequested(type: value));
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<CharacterBloc>().add(CharacterRequested());
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final state = context.read<CharacterBloc>().state;
      if (state is CharacterSuccess && !state.hasReachedMax) {
        context.read<CharacterBloc>().add(CharacterLoadMore());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Rick and Morty'), actions: []),
      drawer: Drawer(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'FIND BY...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 16),
                    DropdownMenu(
                      label: Text('Status'),
                      onSelected: (StatusCharacter? value) {
                        context.read<CharacterBloc>().add(
                          CharacterRequested(status: value?.name ?? ''),
                        );
                        Navigator.pop(context);
                      },
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: StatusCharacter.alive,
                          label: 'Alive',
                        ),
                        DropdownMenuEntry(
                          value: StatusCharacter.dead,
                          label: 'Dead',
                        ),
                        DropdownMenuEntry(
                          value: StatusCharacter.unknown,
                          label: 'Unknown',
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SearchBar(
                      hintText: 'Species',
                      leading: Icon(Icons.pets),

                      onChanged: (value) {
                        onSearchSpeciesChanged(value.toLowerCase());
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 16),
                    SearchBar(
                      hintText: 'Type',
                      leading: Icon(Icons.supervisor_account),
                      onChanged: (value) {
                        onSearchTypeChanged(value.toLowerCase());
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 16),
                    DropdownMenu(
                      label: Text('Gender'),

                      onSelected: (GenderCharacter? value) {
                        context.read<CharacterBloc>().add(
                          CharacterRequested(gender: value?.name ?? ''),
                        );
                        Navigator.pop(context);
                      },
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: GenderCharacter.female,
                          label: 'Female',
                        ),
                        DropdownMenuEntry(
                          value: GenderCharacter.male,
                          label: 'Male',
                        ),
                        DropdownMenuEntry(
                          value: GenderCharacter.genderless,
                          label: 'Genderless',
                        ),

                        DropdownMenuEntry(
                          value: GenderCharacter.unknown,
                          label: 'Unknown',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CharacterBloc>().add(CharacterRequested());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                context.select((CharacterBloc bloc) {
                  final state = bloc.state;
                  if (state is CharacterSuccess) {
                    return 'Total Characters: ${state.totalCount}';
                  }
                  return 'Total Characters: 0';
                }),
              ),
              SearchBar(
                leading: Icon(Icons.search),
                hintText: 'Character',
                onChanged: (value) {
                  onSearchNameChanged(value);
                },
              ),
              SizedBox(height: 16),
              BlocBuilder<CharacterBloc, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CharacterSuccess) {
                    return Expanded(
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
                            character: state.characters[index],
                          );
                        },
                      ),
                    );
                  } else if (state is CharacterFailure) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Lottie.asset(
                            'assets/error.json',
                            height: 200,
                            width: 200,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: OutlinedButton(
                              onPressed: () {
                                context.read<CharacterBloc>().add(
                                  CharacterRequested(),
                                );
                              },
                              child: Text('Reintentar'),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
