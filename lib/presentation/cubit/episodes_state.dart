part of 'episodes_cubit.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object> get props => [];
}

class EpisodesInitialState extends EpisodesState {}

class EpisodeLoadingState extends EpisodesState {}

class EpisodesLoadedState extends EpisodesState {
  final List<EpisodeEntity> episodes;

  const EpisodesLoadedState({required this.episodes});
}

class EpisodeErrorState extends EpisodesState {
  final String msgError;

  const EpisodeErrorState({required this.msgError});
}
