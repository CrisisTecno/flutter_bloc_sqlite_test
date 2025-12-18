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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detalle del Personaje',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
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
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
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
    );
  }
}
