part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();


  @override
  List<Object> get props => [];
}

class CharacterRequested extends CharacterEvent {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;

  const CharacterRequested(
      {this.name, this.status, this.species, this.type, this.gender});

  @override
  List<Object> get props =>
      [name ?? '', status ?? '', species ?? '', type ?? '', gender ?? ''];
}

class CharacterLoadMore extends CharacterEvent {}
