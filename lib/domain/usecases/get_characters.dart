import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/common/usecases/usecase.dart';
import 'package:app_breaking_bad/domain/entity/characters_entity.dart';
import 'package:app_breaking_bad/domain/repository/characters_repository.dart';
import 'package:dartz/dartz.dart';

class GetCharacters implements UsesCase<List<CharactersEntity>, void> {
  final CharacterRepository repository;

  GetCharacters({required this.repository});

  @override
  Future<Either<Failure, List<CharactersEntity>>> call([void p]) async {
    return await repository.getCharacters();
  }
}
