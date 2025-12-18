import 'package:flutter/material.dart';

import '../../../../api-items/domain/domain.dart';

class PrefsCharacterHeader extends StatelessWidget {
  final CharacterEntity character;

  const PrefsCharacterHeader({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            character.image,
            height: 260,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 260,
              color: Colors.grey[800],
              child: const Icon(
                Icons.person,
                size: 100,
                color: Colors.white54,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          character.name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
