import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/domain.dart';
import '../../presentation.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/character/${character.id}', extra: character);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade300,
                Colors.lightGreen.withAlpha(25),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CharacterImage(image: character.image),
                const SizedBox(width: 12),

                Expanded(
                  child: CharacterInfo(character: character),
                ),

                ActionButtons(
                  onFavorite: () {
                    context.push(
                      '/prefs/new',
                      extra: character,
                    );
                  },
                  onDetails: () {
                    context.push(
                      '/character/${character.id}',
                      extra: character,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
