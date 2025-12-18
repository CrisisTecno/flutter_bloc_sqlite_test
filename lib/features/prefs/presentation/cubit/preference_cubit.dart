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

  Future<void> loadPreferences() async {
    emit(PreferenceLoading());
    try {
      final items = await getAllUseCase();
      emit(PreferenceLoaded(List.from(items)));
    } catch (e) {
      emit(const PreferenceError('Error al cargar preferencias'));
    }
  }

  Future<void> addPreference(PreferenceEntity entity) async {
    try {
      await addUseCase(entity);
      await loadPreferences();
    } catch (e) {
      emit(const PreferenceError('Error al guardar preferencia'));
    }
  }

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

  Future<void> updatePreference(PreferenceEntity entity) async {
    emit(PreferenceLoading());
    await updateUseCase(entity);

    final items = await getAllUseCase();
    emit(PreferenceLoaded(List.from(items)));
  }

  Future<void> deletePreference(int id) async {
    emit(PreferenceLoading());
    await deleteUseCase(id);

    final items = await getAllUseCase();
    emit(PreferenceLoaded(List.from(items)));
  }
}
