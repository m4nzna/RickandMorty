import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/models/character_model.dart';

import '../services/character_service.dart';

part 'character_event.dart';

part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService characterService;
  String? _currentSearch;
  String? _currentStatus;
  String? _currentSpecies;
  String? _currentType;
  String? _currentGender;
  bool isFetching = false;

  CharacterBloc(this.characterService) : super(CharacterInitial()) {
    on<CharacterRequested>((event, emit) async {
      emit(CharacterLoading());
      _currentSearch = event.name;
      _currentStatus = event.status;
      _currentSpecies = event.species;
      _currentType = event.type;
      _currentGender = event.gender;
      try {
        final response = await characterService.getCharacters(
          page: 1,
          name: _currentSearch,
          status: _currentStatus,
          species: _currentSpecies,
          type: _currentType,
          gender: _currentGender,
        );
        emit(
          CharacterSuccess(
            response.results,
            response.info.next == null,
            1,
            totalCount: response.results.length,
          ),
        );
      } catch (e) {
        emit(CharacterFailure('Error fetching characters: ${e.toString()}'));
      }
    });

    on<CharacterLoadMore>((event, emit) async {
      if (isFetching) return;
      final state = this.state;

      if (state is! CharacterSuccess || state.hasReachedMax) return;
      isFetching = true;

      final nextPage = state.currentPage + 1;
      await Future.delayed(const Duration(milliseconds: 500));

      try {
        final response = await characterService.getCharacters(
          page: nextPage,
          name: _currentSearch,
          status: _currentStatus,
          species: _currentSpecies,
          type: _currentType,
          gender: _currentGender,
        );
        emit(
          CharacterSuccess(
            [...state.characters, ...response.results],
            response.info.next == null,
            nextPage,
            totalCount: state.characters.length,
          ),
        );
      } catch (e) {
        emit(CharacterFailure('Error fetching characters: ${e.toString()}'));
      } finally {
        isFetching = false;
      }
    });
  }
}
