

import '../entities/preference_entity.dart';
import '../repositories/preference_repository.dart';

class AddPreferenceUseCase {
  final PrefsRepository repository;

  AddPreferenceUseCase(this.repository);

  Future<void> call(PreferenceEntity entity) {
    return repository.addPreference(entity);
  }
}
