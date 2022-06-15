import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/common/usecases/usecase.dart';
import 'package:app_breaking_bad/domain/entity/episode_entity.dart';
import 'package:app_breaking_bad/domain/repository/episodes_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodes implements UsesCase<List<EpisodeEntity>, void> {
  final EpisodeRepository repository;

  GetEpisodes({required this.repository});

  @override
  Future<Either<Failure, List<EpisodeEntity>>> call([void p]) async {
    return await repository.getEpisodes();
  }
}
