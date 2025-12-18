

import '../entities/preference_entity.dart';
import '../repositories/preference_repository.dart';


class UpdatePreferenceUseCase {
  final PrefsRepository repository;

  UpdatePreferenceUseCase(this.repository);

  Future<void> call(PreferenceEntity entity) {
    return repository.updatePreference(entity);
  }
}
