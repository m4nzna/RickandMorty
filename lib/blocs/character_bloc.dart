import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/models/character_model.dart';

import '../services/character_service.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService characterService;

  CharacterBloc(this.characterService) : super(CharacterInitial()) {
    on<CharacterRequested>((event, emit) async{
      emit(CharacterLoading());
      try{
        final response = await characterService.getCharacters(page: 1);
        emit(CharacterSuccess(response.results, response.info.next == null, 1));
      }catch(e){
        emit(CharacterFailure('Error fetching characters: ${e.toString()}'));
      }
    });

    on<CharacterLoadMore>((event, emit) async {
      print('CharacterLOadrMore');
      //emit(CharacterLoading());
      final state = this.state;
      print('1');

      if (state is! CharacterSuccess || state.hasReachedMax) return;
      print('2');

      final nextPage = state.currentPage + 1;
      print(nextPage);
      try {
        final response = await characterService.getCharacters(page: nextPage);
        print(response);
        emit(CharacterSuccess([
          ...state.characters,
          ...response.results,
        ], response.info.next == null, nextPage));
      } catch (e) {
        print(e);
        emit(CharacterFailure('Error fetching characters: ${e.toString()}'));
      }
    });

  }
}
