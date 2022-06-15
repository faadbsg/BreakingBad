import 'package:app_breaking_bad/common/network/network_info.dart';
import 'package:app_breaking_bad/data/datasources/characters_remote_data_sources.dart';
import 'package:app_breaking_bad/data/datasources/episodes_remote_data_sources.dart';
import 'package:app_breaking_bad/data/repository/characters_repository_impl.dart';
import 'package:app_breaking_bad/data/repository/episodes_repository_impl.dart';
import 'package:app_breaking_bad/domain/repository/characters_repository.dart';
import 'package:app_breaking_bad/domain/repository/episodes_repository.dart';
import 'package:app_breaking_bad/domain/usecases/get_characters.dart';
import 'package:app_breaking_bad/domain/usecases/get_episodes.dart';
import 'package:app_breaking_bad/presentation/cubit/characters_cubit.dart';
import 'package:app_breaking_bad/presentation/cubit/episodes_cubit.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Feature
  sl.registerFactory(() => CharactersCubit(sl()));
  sl.registerFactory(() => EpisodesCubit(sl()));

  //usecase
  sl.registerLazySingleton(() => GetCharacters(repository: sl()));
  sl.registerLazySingleton(() => GetEpisodes(repository: sl()));

  //repository
  sl.registerLazySingleton<CharacterRepository>(() => CharactersRepositoryImpl(
        networkInfo: sl(),
        remote: sl(),
      ));
  sl.registerLazySingleton<EpisodeRepository>(() => EpisodeRepositoryImpl(
        networkInfo: sl(),
        remoteDataSources: sl(),
      ));

  //Datasources from data domain
  sl.registerLazySingleton<CharactersRemoteDataSources>(
      () => CharactersRemoteDataSourcesImpl(client: sl()));
  sl.registerLazySingleton<EpisodesRemoteDataSources>(
      () => EpisodesRemoteDataSourcesImpl(client: sl()));

  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

  //Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
