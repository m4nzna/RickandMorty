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
        final character = await characterService.getCharacters();
        emit(CharacterSuccess(character.results));
      }catch(e){
        emit(CharacterFailure('Error fetching characters: ${e.toString()}'));
      }
    });
  }
}
