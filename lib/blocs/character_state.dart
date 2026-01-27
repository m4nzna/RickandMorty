part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}


final class CharacterExist extends CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterSuccess extends CharacterState {
  final List<Character>? characters;
  CharacterSuccess(this.characters);

  @override
  List<Object?> get props => [characters];

}

final class CharacterFailure extends CharacterState {
  final String message;

  CharacterFailure(this.message);

  @override
  List<Object?> get props => [message];
}
