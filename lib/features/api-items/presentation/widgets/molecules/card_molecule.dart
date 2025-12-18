import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import '../widgets.dart';

class InfoCardMolecule extends StatelessWidget {
  final CharacterEntity character;

  const InfoCardMolecule({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.grey[50],
      //   borderRadius: BorderRadius.circular(16),
      //   border: Border.all(
      //     color: Colors.grey[200]!,
      //   ),
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green.shade300, Colors.lightGreen.withAlpha(100)],
        ),
      ),
      child: Column(
        children: [
          InfoRowMolecule(
            icon: Icons.favorite,
            label: 'Estado',
            value: character.status,
            iconColor: character.status == 'Alive' ? Color(0xFF0B0F1A) : Colors.red,
          ),
          const SectionDividerAtom(),
          InfoRowMolecule(
            icon: Icons.pets,
            label: 'Especie',
            value: character.species,
            iconColor: Color(0xFF0B0F1A),
          ),
          const SectionDividerAtom(),
          InfoRowMolecule(
            icon: Icons.badge,
            label: 'ID',
            value: '#${character.id}',
            iconColor: Color(0xFF0B0F1A),
          ),
        ],
      ),
    );
  }
}
