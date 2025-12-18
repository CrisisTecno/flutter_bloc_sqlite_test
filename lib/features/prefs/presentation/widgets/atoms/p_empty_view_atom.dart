
import 'package:flutter/material.dart';

class PrefsEmptyView extends StatelessWidget {
  const PrefsEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No hay personajes guardados',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}
