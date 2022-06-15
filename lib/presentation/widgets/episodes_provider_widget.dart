import 'package:app_breaking_bad/injection_container.dart';
import 'package:app_breaking_bad/presentation/cubit/episodes_cubit.dart';
import 'package:app_breaking_bad/presentation/widgets/episodes_loaded_widget.dart';
import 'package:app_breaking_bad/presentation/widgets/error_widget.dart';
import 'package:app_breaking_bad/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesProviderWidget extends StatefulWidget {
  const EpisodesProviderWidget({Key? key}) : super(key: key);

  @override
  State<EpisodesProviderWidget> createState() => _EpisodesProviderWidgetState();
}

class _EpisodesProviderWidgetState extends State<EpisodesProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<EpisodesCubit>(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<EpisodesCubit, EpisodesState>(
                    builder: (context, state) {
                  if (state is EpisodesInitialState) {
                    return const SizedBox.shrink();
                  } else if (state is EpisodeLoadingState) {
                    return const LoadingWidget();
                  } else if (state is EpisodesLoadedState) {
                    return EpisodeLoadedWidget(episodesList: state.episodes);
                  } else if (state is EpisodeErrorState) {
                    return ErrorDisplayWidget(messageError: state.msgError);
                  } else {
                    throw '';
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
