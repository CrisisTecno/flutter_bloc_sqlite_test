import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_characters_usecase.dart';
import 'api_items_state.dart';

class ApiItemsCubit extends Cubit<ApiItemsState> {
  final GetCharactersUseCase getCharactersUseCase;

  ApiItemsCubit(this.getCharactersUseCase)
      : super(ApiItemsInitial());

  Future<void> fetchCharacters(List<int> ids) async {
    emit(ApiItemsLoading());

    try {
      final result = await getCharactersUseCase(ids);
      emit(ApiItemsLoaded(result));
    } catch (e) {
      emit(ApiItemsError('Error al cargar personajes'));
    }
  }
}
