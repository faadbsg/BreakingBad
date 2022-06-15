import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/domain/entity/episode_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes();
}
