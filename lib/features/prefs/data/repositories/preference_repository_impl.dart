
import 'package:flutter_test_ricky/features/prefs/domain/domain.dart';
import '../data.dart';

class PrefsRepositoryImpl implements PrefsRepository {
  final PrefsLocalDataSource localDataSource;

  PrefsRepositoryImpl(this.localDataSource);

  @override
  Future<void> addPreference(PreferenceEntity entity) async {
    final model = PreferenceModel(
      id: entity.id,
      name: entity.name,
      customName: entity.customName,
      image: entity.image,
      status: entity.status,
      species: entity.species,
    );
    await localDataSource.addPreference(model);
  }

  @override
  Future<List<PreferenceEntity>> getPreferences() {
    return localDataSource.getPreferences();
  }

  @override
  Future<PreferenceEntity?> getPreferenceById(int id) {
    return localDataSource.getPreferenceById(id);
  }

  @override
  Future<void> updatePreference(PreferenceEntity entity) async {
    final model = PreferenceModel(
      id: entity.id,
      name: entity.name,
      customName: entity.customName,
      image: entity.image,
      status: entity.status,
      species: entity.species,
    );
    await localDataSource.updatePreference(model);
  }

  @override
  Future<void> deletePreference(int id) {
    return localDataSource.deletePreference(id);
  }
}
