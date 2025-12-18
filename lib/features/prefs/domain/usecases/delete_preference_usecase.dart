

import '../repositories/preference_repository.dart';



class DeletePreferenceUseCase {
  final PrefsRepository repository;

  DeletePreferenceUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deletePreference(id);
  }
}
