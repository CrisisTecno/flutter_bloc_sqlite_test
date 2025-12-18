import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class PrefsInfoCard extends StatelessWidget {
  final PreferenceEntity item;

  const PrefsInfoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _row('Estado', item.status),
          _divider(),
          _row('Especie', item.species),
          _divider(),
          _row('ID', '#${item.id}'),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(
        color: Colors.white.withOpacity(0.1),
        height: 1,
      );
}
