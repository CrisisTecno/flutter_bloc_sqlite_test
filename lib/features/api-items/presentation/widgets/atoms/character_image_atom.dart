

import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String image;

  const CharacterImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
      child: Image.network(
        image,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 80,
          height: 80,
          color: Colors.grey[300],
          child: const Icon(Icons.person),
        ),
      ),
    );
  }
}
