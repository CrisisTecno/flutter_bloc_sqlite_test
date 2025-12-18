

import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class CharacterInfo extends StatelessWidget {
  final CharacterEntity character;

  const CharacterInfo({required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          character.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1B5E20),
                fontSize: 19,
              ),
        ),
        const SizedBox(height: 6),

        Row(
          children: [
            Text(
              'Especie: ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,fontSize: 14
                  ),
            ),
            Expanded(
              child: Text(
                character.species,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey[700],fontSize: 14),
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        Row(
          children: [
            Icon(
              character.status == 'Alive'
                  ? Icons.check_circle
                  : Icons.cancel,
              size: 16,
              color:
                  character.status == 'Alive'
                      ? Colors.green
                      : Colors.red,
            ),
            const SizedBox(width: 6),
            Text(
              character.status,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B5E20),
                    fontSize: 16
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
