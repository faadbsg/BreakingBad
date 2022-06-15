import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/domain/entity/characters_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharactersEntity>>> getCharacters();
}
