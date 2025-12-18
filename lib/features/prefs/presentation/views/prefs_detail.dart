import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/preference_entity.dart';
import '../cubit/preference_cubit.dart';
import '../cubit/preference_state.dart';
import '../widgets/widgets.dart';

class PrefsDetailPage extends StatefulWidget {
  final int? prefsId;
  final PreferenceEntity? initialPreference;

  const PrefsDetailPage({super.key, this.prefsId, this.initialPreference});

  @override
  State<PrefsDetailPage> createState() => _PrefsDetailPageState();
}

class _PrefsDetailPageState extends State<PrefsDetailPage> {
  bool loaded = false;
  bool isEditing = false;

  final TextEditingController customNameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (loaded) return;
    loaded = true;

    final cubit = context.read<PreferenceCubit>();

    if (widget.initialPreference != null) {
      cubit.getPreference(widget.initialPreference!.id);
    } else if (widget.prefsId != null) {
      cubit.getPreference(widget.prefsId!);
    } else {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is int) {
        cubit.getPreference(args);
      }
    }
  }

  @override
  void dispose() {
    customNameController.dispose();
    super.dispose();
  }

  void startEdit(PreferenceEntity item) {
    setState(() {
      isEditing = true;
      customNameController.text = item.customName;
    });
  }

  void saveEdit(PreferenceEntity item) {
    final updated = PreferenceEntity(
      id: item.id,
      name: item.name,
      customName: customNameController.text,
      image: item.image,
      status: item.status,
      species: item.species,
    );
    context.read<PreferenceCubit>().updatePreference(updated);
    setState(() => isEditing = false);
    context.pop(true);
  }

  void confirmDelete(int id) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Eliminar'),
            content: const Text('¿Deseas eliminar este favorito?'),
            actions: [
              TextButton(onPressed: context.pop, child: const Text('Cancelar')),
              TextButton(
                onPressed: () {
                  context.read<PreferenceCubit>().deletePreference(id);
                  context.pop();
                  context.pop(true);
                },
                child: const Text(
                  'Eliminar',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PreferenceCubit>().loadPreferences();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0F1A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF0B0F1A),
          foregroundColor: Colors.white,
          title: const Text(
            'Detalle del favorito',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<PreferenceCubit>().loadPreferences();
              context.pop();
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF0B0F1A), Color(0xFF1B5E20)],
            ),
          ),
          child: BlocBuilder<PreferenceCubit, PreferenceState>(
            builder: (_, state) {
              if (state is PreferenceLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.greenAccent),
                );
              }

              if (state is PreferenceDetailLoaded) {
                final item = state.item;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      PrefsDetailHeader(image: item.image, id: item.id),
                      const SizedBox(height: 24),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: isEditing ? 0.3 : 1,
                        child: PrefsDetailTitle(item: item),
                      ),
                      const SizedBox(height: 24),
                      if (isEditing)
                        PrefsEditForm(controller: customNameController)
                      else
                        PrefsInfoCard(item: item),
                      const SizedBox(height: 32),
                      PrefsActionButtons(
                        isEditing: isEditing,
                        onEdit: () => startEdit(item),
                        onSave: () => saveEdit(item),
                        onDelete: () => confirmDelete(item.id),
                      ),
                    ],
                  ),
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

              return const Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            },
          ),
        ),
      ),
    );
  }
}
