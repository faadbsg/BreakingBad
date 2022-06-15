import 'package:app_breaking_bad/injection_container.dart';
import 'package:app_breaking_bad/presentation/cubit/characters_cubit.dart';
import 'package:app_breaking_bad/presentation/pages/welcome_page.dart';
import 'package:app_breaking_bad/presentation/widgets/characters_loaded_widget.dart';
import 'package:app_breaking_bad/presentation/widgets/error_widget.dart';
import 'package:app_breaking_bad/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersProviderWidget extends StatefulWidget {
  const CharactersProviderWidget({Key? key}) : super(key: key);

  @override
  State<CharactersProviderWidget> createState() =>
      _CharactersProviderWidgetState();
}

class _CharactersProviderWidgetState extends State<CharactersProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<CharactersCubit>(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<CharactersCubit, CharactersState>(
                    builder: (context, state) {
                  if (state is CharactersInitial) {
                    return const SizedBox.shrink();
                  } else if (state is CharactersLoading) {
                    return const LoadingWidget();
                  } else if (state is CharactersLoaded) {
                    return LoadedCharacterWidget(
                        charactersList: state.characters);
                  } else if (state is CharactersError) {
                    return ErrorDisplayWidget(messageError: state.msgError);
                  } else {
                    throw '';
                  }
                }),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
