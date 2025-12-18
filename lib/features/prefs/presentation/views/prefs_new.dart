import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../api-items/domain/domain.dart';
import '../../domain/entities/preference_entity.dart';
import '../presentation.dart';

class PrefsNewPage extends StatefulWidget {
  final CharacterEntity? initialCharacter;

  const PrefsNewPage({
    super.key,
    this.initialCharacter,
  });

  @override
  State<PrefsNewPage> createState() => _PrefsNewPageState();
}

class _PrefsNewPageState extends State<PrefsNewPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final character = widget.initialCharacter ??
        (ModalRoute.of(context)?.settings.arguments as CharacterEntity?);

    if (character == null) {
      return const Scaffold(
        body: Center(child: Text('No se recibió el personaje')),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0B0F1A),
        foregroundColor: Colors.white,
        title: const Text(
          'Nuevo favorito',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF0B0F1A),
              Color(0xFF1B5E20),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              PrefsCharacterHeader(character: character),
              const SizedBox(height: 32),
              PrefsNameField(controller: controller),
              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        context.read<PreferenceCubit>().addPreference(
                              PreferenceEntity(
                                id: character.id,
                                name: character.name,
                                customName: controller.text,
                                image: character.image,
                                status: character.status,
                                species: character.species,
                              ),
                            );
                        context.pop();
                      },
                      child: const Text(
                        'Guardar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white54),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => context.pop(),
                      child: const Text('Cancelar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
