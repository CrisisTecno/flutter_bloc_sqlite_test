

import '../../domain/domain.dart';

class PreferenceModel extends PreferenceEntity {
  const PreferenceModel({
    required super.id,
    required super.name,
    required super.customName,
    required super.image,
    required super.status,
    required super.species,
  });

  factory PreferenceModel.fromDb(Map<String, dynamic> map) {
    return PreferenceModel(
      id: map['id'],
      name: map['name'],
      customName: map['custom_name'],
      image: map['image'],
      status: map['status'],
      species: map['species'],
    );
  }

  Map<String, dynamic> toDb() {
    return {
      'id': id,
      'name': name,
      'custom_name': customName,
      'image': image,
      'status': status,
      'species': species,
    };
  }
}
