
import 'package:flutter/material.dart';
import '../widgets.dart';

class InfoRowMolecule extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  const InfoRowMolecule({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          InfoIconAtom(
            icon: icon,
            color: iconColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: InfoTextAtom(
              label: label,
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}
