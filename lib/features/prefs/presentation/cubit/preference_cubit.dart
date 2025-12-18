import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import 'preference_state.dart';

class PreferenceCubit extends Cubit<PreferenceState> {
  final AddPreferenceUseCase addUseCase;
  final GetPreferencesUseCase getAllUseCase;
  final GetPreferenceByIdUseCase getByIdUseCase;
  final UpdatePreferenceUseCase updateUseCase;
  final DeletePreferenceUseCase deleteUseCase;

  PreferenceCubit({
    required this.addUseCase,
    required this.getAllUseCase,
    required this.getByIdUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
  }) : super(PreferenceInitial());

  // ======================
  // LOAD ALL
  // ======================
  Future<void> loadPreferences() async {
    emit(PreferenceLoading());
    try {
      final items = await getAllUseCase();
      emit(PreferenceLoaded(items));
    } catch (e) {
      emit(const PreferenceError('Error al cargar preferencias'));
    }
  }

  // ======================
  // ADD
  // ======================
  Future<void> addPreference(PreferenceEntity entity) async {
    try {
      await addUseCase(entity);
      await loadPreferences();
    } catch (e) {
      emit(const PreferenceError('Error al guardar preferencia'));
    }
  }

  // ======================
  // GET BY ID
  // ======================
  Future<void> getPreference(int id) async {
    emit(PreferenceLoading());
    try {
      final item = await getByIdUseCase(id);
      if (item != null) {
        emit(PreferenceDetailLoaded(item));
      } else {
        emit(const PreferenceError('Elemento no encontrado'));
      }
    } catch (e) {
      emit(const PreferenceError('Error al obtener el detalle'));
    }
  }

  // ======================
  // UPDATE
  // ======================
  Future<void> updatePreference(PreferenceEntity entity) async {
    emit(PreferenceLoading());
    try {
      await updateUseCase(entity);
      // Volvemos a emitir el detalle actualizado
      emit(PreferenceDetailLoaded(entity));
    } catch (e) {
      emit(const PreferenceError('Error al actualizar preferencia'));
    }
  }

  // ======================
  // DELETE
  // ======================
  Future<void> deletePreference(int id) async {
    try {
      await deleteUseCase(id);
      await loadPreferences();
    } catch (e) {
      emit(const PreferenceError('Error al eliminar preferencia'));
    }
  }
}
