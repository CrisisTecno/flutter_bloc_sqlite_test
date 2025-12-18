
import '../entities/preference_entity.dart';
import '../repositories/preference_repository.dart';



class GetPreferencesUseCase {
  final PrefsRepository repository;

  GetPreferencesUseCase(this.repository);

  Future<List<PreferenceEntity>> call() {
    return repository.getPreferences();
  }
}
