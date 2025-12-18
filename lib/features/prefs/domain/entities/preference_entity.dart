


import 'package:equatable/equatable.dart';
// tecnicamente igual al CharacterEntity con la differencia
// del atributo customName que necesita nuestra tabla local
// aunque creo que debeian partir del mismo y extender XD
class PreferenceEntity extends Equatable {
  final int id;
  final String name;
  final String customName;
  final String image;
  final String status;
  final String species;

  const PreferenceEntity({
    required this.id,
    required this.name,
    required this.customName,
    required this.image,
    required this.status,
    required this.species,
  });

  @override
  List<Object?> get props => [id];
}
