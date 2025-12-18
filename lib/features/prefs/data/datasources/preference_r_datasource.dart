
import '../../../../core/database/tables/character_helpers.dart';
import '../models/preference_model.dart';

abstract class PrefsLocalDataSource {
  Future<void> addPreference(PreferenceModel model);
  Future<List<PreferenceModel>> getPreferences();
  Future<PreferenceModel?> getPreferenceById(int id);
  Future<void> updatePreference(PreferenceModel model);
  Future<void> deletePreference(int id);
}

class PrefsLocalDataSourceImpl implements PrefsLocalDataSource {
  final DatabaseHelper databaseHelper;

  PrefsLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<void> addPreference(PreferenceModel model) async {
    await databaseHelper.insertCharacter(model.toDb());
  }

  @override
  Future<List<PreferenceModel>> getPreferences() async {
    final result = await databaseHelper.getAllCharacters();
    return result.map(PreferenceModel.fromDb).toList();
  }

  @override
  Future<PreferenceModel?> getPreferenceById(int id) async {
    final result = await databaseHelper.getCharacterById(id);
    if (result == null) return null;
    return PreferenceModel.fromDb(result);
  }

  @override
  Future<void> updatePreference(PreferenceModel model) async {
    await databaseHelper.updateCharacter(model.id, model.toDb());
  }

  @override
  Future<void> deletePreference(int id) async {
    await databaseHelper.deleteCharacter(id);
  }
}
