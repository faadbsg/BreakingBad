import 'package:app_breaking_bad/common/error/failure.dart';
import 'package:app_breaking_bad/domain/entity/episode_entity.dart';
import 'package:app_breaking_bad/domain/usecases/get_episodes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final GetEpisodes episodeUsescases;
  EpisodesCubit(this.episodeUsescases) : super(EpisodesInitialState()) {
    getAllEpisodes();
  }

  Future<void> getAllEpisodes() async {
    emit(EpisodeLoadingState());
    final episodesList = await episodeUsescases.call();
    emit(episodesList.fold(
      (failure) => EpisodeErrorState(msgError: _failureType(failure)),
      (episode) => EpisodesLoadedState(episodes: episode),
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
}//end class

