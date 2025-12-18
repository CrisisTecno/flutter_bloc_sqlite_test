import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ricky/core/routes/app_routes.dart' as AppRoutes;
import '../cubit/preference_cubit.dart';
import '../cubit/preference_state.dart';
import '../../domain/entities/preference_entity.dart';
import '../widgets/widgets.dart';

class PrefsListPage extends StatefulWidget {
  const PrefsListPage({super.key});

  @override
  State<PrefsListPage> createState() => _PrefsListPageState();
}

class _PrefsListPageState extends State<PrefsListPage> {
  final TextEditingController searchController = TextEditingController();
  List<PreferenceEntity> filtered = [];

  @override
  void initState() {
    super.initState();
    context.read<PreferenceCubit>().loadPreferences();
  }

  void filterItems(String query, List<PreferenceEntity> items) {
    setState(() {
      filtered = items
          .where(
            (e) => e.customName.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0B0F1A),
        title: const Text(
          'Mis Favoritos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.prefsNew);
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
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
            PrefsSearchBar(
              controller: searchController,
              onChanged: (value) {
                final state = context.read<PreferenceCubit>().state;
                if (state is PreferenceLoaded) {
                  filterItems(value, state.items);
                }
              },
            ),
            Expanded(
              child: BlocBuilder<PreferenceCubit, PreferenceState>(
                builder: (_, state) {
                  if (state is PreferenceLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.greenAccent,
                      ),
                    );
                  }

                  if (state is PreferenceLoaded) {
                    final items = searchController.text.isEmpty
                        ? state.items
                        : filtered;

                    if (items.isEmpty) {
                      return const PrefsEmptyView();
                    }

                    return PrefsListView(
                      items: items,
                      onDelete: (id) {
                        context
                            .read<PreferenceCubit>()
                            .deletePreference(id);
                      },
                    );
                  }

                  if (state is PreferenceError) {
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
