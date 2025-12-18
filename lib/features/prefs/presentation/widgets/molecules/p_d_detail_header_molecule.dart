import 'package:flutter/material.dart';

class PrefsDetailHeader extends StatelessWidget {
  final String image;
  final int id;

  const PrefsDetailHeader({
    super.key,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'pref_$id',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          image,
          height: 280,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}