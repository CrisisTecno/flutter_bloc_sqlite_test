

import 'package:flutter/material.dart';

class CombinedTabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onSelected;

  const CombinedTabs({
    super.key,
    required this.index,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ToggleButtons(
        isSelected: [index == 0, index == 1],
        onPressed: onSelected,
        borderRadius: BorderRadius.circular(14),
        selectedColor: Colors.black,
        fillColor: Colors.greenAccent,
        color: Colors.white70,
        constraints: const BoxConstraints(minWidth: 120, minHeight: 36),
        children: const [
          Text('API'),
          Text('Favoritos'),
        ],
      ),
    );
  }
}
