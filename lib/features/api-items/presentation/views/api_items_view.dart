

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';


class ApiListView extends StatelessWidget {
  const ApiListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiItemsCubit, ApiItemsState>(
      builder: (context, state) {
        if (state is ApiItemsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ApiItemsLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: state.characters.length,
            itemBuilder: (_, index) {
              final character = state.characters[index];
              return CharacterCard(character: character);
            },
          );
        }

        if (state is ApiItemsError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
