

import 'package:flutter/material.dart';

class SectionDividerAtom extends StatelessWidget {
  const SectionDividerAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.grey[200],
      indent: 16,
      endIndent: 16,
    );
  }
}
