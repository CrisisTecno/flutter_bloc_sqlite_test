

import 'package:flutter/material.dart';
import 'package:flutter_test_ricky/features/combined/widgets/combined_tabs.dart';

class CombinedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int index;
  final ValueChanged<int> onTabSelected;

  const CombinedAppBar({
    super.key,
    required this.index,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF0B0F1A),
      title: Text(
        index == 0 ? 'Rick & Morty' : 'Mis Favoritos',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CombinedTabs(
          index: index,
          onSelected: onTabSelected,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(112);
}
