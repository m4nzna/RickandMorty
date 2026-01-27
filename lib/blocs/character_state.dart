part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}


final class CharacterExist extends CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterSuccess extends CharacterState {
  final List<Result> characters;
  final bool hasReachedMax;
  final int currentPage;

  CharacterSuccess(this.characters, this.hasReachedMax, this.currentPage);

  @override
  List<Object?> get props => [characters, hasReachedMax, currentPage];
}

final class CharacterFailure extends CharacterState {
  final String message;

  CharacterFailure(this.message);

  @override
  List<Object?> get props => [message];
}
