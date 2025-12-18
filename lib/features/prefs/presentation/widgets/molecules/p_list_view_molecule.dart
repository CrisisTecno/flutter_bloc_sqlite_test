
import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import 'p_item_molecule.dart';

class PrefsListView extends StatelessWidget {
  final List<PreferenceEntity> items;
  final ValueChanged<int> onDelete;

  const PrefsListView({
    super.key,
    required this.items,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];
        return PrefsItemCard(
          item: item,
          onDelete: () => onDelete(item.id),
        );
      },
    );
  }
}
