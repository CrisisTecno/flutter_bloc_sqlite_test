import 'package:flutter/material.dart';
import '../../../domain/domain.dart';

class PrefsDetailTitle extends StatelessWidget {
  final PreferenceEntity item;

  const PrefsDetailTitle({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          item.customName,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          item.name,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
