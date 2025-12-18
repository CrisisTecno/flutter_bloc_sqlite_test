


import '../entities/preference_entity.dart';

abstract class PrefsRepository {
  Future<void> addPreference(PreferenceEntity entity);
  Future<List<PreferenceEntity>> getPreferences();
  Future<PreferenceEntity?> getPreferenceById(int id);
  Future<void> updatePreference(PreferenceEntity entity);
  Future<void> deletePreference(int id);
}
