import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class ApiListView extends StatefulWidget {
  const ApiListView({super.key});

  @override
  State<ApiListView> createState() => _ApiListViewState();
}

class _ApiListViewState extends State<ApiListView> {
  final TextEditingController _searchController = TextEditingController();
  List<CharacterEntity> _filteredCharacters = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();  
  }

  void _filterCharacters(
    String query,
    List<CharacterEntity> characters,
  ) {
    setState(() {
      _filteredCharacters = characters
          .where(
            (c) => c.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0B0F1A),
              Color(0xFF1B5E20),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Buscar personaje...',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  final state =
                      context.read<ApiItemsCubit>().state;
                  if (state is ApiItemsLoaded) {
                    _filterCharacters(value, state.characters);
                  }
                },
              ),
            ),

            Expanded(
              child: BlocBuilder<ApiItemsCubit, ApiItemsState>(
                builder: (context, state) {
                  if (state is ApiItemsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.greenAccent,
                      ),
                    );
                  }

                  if (state is ApiItemsLoaded) {
                    final characters = _searchController.text.isEmpty
                        ? state.characters
                        : _filteredCharacters;

                    if (characters.isEmpty) {
                      return const Center(
                        child: Text(
                          'No se encontraron resultados',
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: characters.length,
                      itemBuilder: (_, index) {
                        final character = characters[index];
                        return CharacterCard(character: character);
                      },
                    );
                  }

                  if (state is ApiItemsError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
