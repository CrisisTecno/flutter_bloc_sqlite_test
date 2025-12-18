

import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onFavorite;
  final VoidCallback onDetails;

  const ActionButtons({
    required this.onFavorite,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onFavorite,
          icon: const Icon(Icons.favorite),
          color: Colors.redAccent,
          tooltip: 'Agregar a favoritos',
        ),
        ElevatedButton(
          onPressed: onDetails,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade700,
            foregroundColor: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: const TextStyle(fontSize: 12),
          ),
          child: const Text('Ver detalles'),
        ),
      ],
    );
  }
}
