import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class CharacterDetailView extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailView({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0B0F1A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Detalle del Personaje',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
      body: Stack(
        children: [
          Container(
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
          ),

          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 100, 16, 24),
                  child: Column(
                    children: [
                      Hero(
                        tag: character.id,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            character.image,
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 350,
                              color: Colors.grey[300],
                              child: const Icon(Icons.person, size: 100),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        character.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 24),
                      InfoCardMolecule(character: character),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
