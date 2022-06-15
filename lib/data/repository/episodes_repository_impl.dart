import 'package:app_breaking_bad/common/error/exception.dart';
import 'package:app_breaking_bad/common/network/network_info.dart';
import 'package:app_breaking_bad/data/datasources/episodes_remote_data_sources.dart';
import 'package:app_breaking_bad/domain/entity/episode_entity.dart';
import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/domain/repository/episodes_repository.dart';
import 'package:dartz/dartz.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final NetworkInfo networkInfo;
  final EpisodesRemoteDataSources remoteDataSources;

  EpisodeRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSources});

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes() async {
    if (await networkInfo.isConnected) {
      try {
        final episodeModels = await remoteDataSources.getEpisodes();
        final episodeEntityList =
            episodeModels.map((e) => e.toEntity()).toList();
        return Right(episodeEntityList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
