
import '../entities/preference_entity.dart';
import '../repositories/preference_repository.dart';



class GetPreferenceByIdUseCase {
  final PrefsRepository repository;

  GetPreferenceByIdUseCase(this.repository);

  Future<PreferenceEntity?> call(int id) {
    return repository.getPreferenceById(id);
  }
}
