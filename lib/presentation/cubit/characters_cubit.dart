import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/domain/entity/characters_entity.dart';
import 'package:app_breaking_bad/domain/usecases/get_characters.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._usecase) : super(CharactersInitial()) {
    getAllCharacters();
  }

  final GetCharacters _usecase;

  Future<void> getAllCharacters() async {
    emit(CharactersLoading());
    final characters = await _usecase.call();
    emit(characters.fold(
      (failure) => CharactersError(msgError: _failureType(failure)),
      (characters) => CharactersLoaded(characters),
    ));
  }

  String _failureType(Failure fail) {
    if (fail is ServerFailure) {
      return "Server Failure";
    } else if (fail is ConnectionFailure) {
      return "Connection Failure";
    } else {
      return "Unknown Failure";
    }
  }
}
