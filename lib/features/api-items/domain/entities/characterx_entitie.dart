

import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
  });

  @override
  List<Object?> get props => [id];
}
