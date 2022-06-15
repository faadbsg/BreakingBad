import 'package:app_breaking_bad/common/error/exception.dart';
import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/common/network/network_info.dart';
import 'package:app_breaking_bad/data/datasources/characters_remote_data_sources.dart';
import 'package:app_breaking_bad/domain/entity/characters_entity.dart';
import 'package:app_breaking_bad/domain/repository/characters_repository.dart';
import 'package:dartz/dartz.dart';

class CharactersRepositoryImpl implements CharacterRepository {
  final CharactersRemoteDataSources remote;
  final NetworkInfo networkInfo;

  CharactersRepositoryImpl({required this.networkInfo, required this.remote});

  @override
  Future<Either<Failure, List<CharactersEntity>>> getCharacters() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharactersModel = await remote.getCharacters();
        final remoteCharactersEntity =
            remoteCharactersModel.map((e) => e.toEntity()).toList();
        return Right(remoteCharactersEntity);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
