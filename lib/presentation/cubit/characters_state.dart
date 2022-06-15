part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharactersEntity> characters;

  const CharactersLoaded(this.characters);
}

class CharactersError extends CharactersState {
  final String msgError;

  const CharactersError({required this.msgError});
}
