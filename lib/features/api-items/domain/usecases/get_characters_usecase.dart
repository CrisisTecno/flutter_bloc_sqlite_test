


import '../domain.dart';

class GetCharactersUseCase {
  final ApiItemsRepository repository;

  GetCharactersUseCase(this.repository);

  Future<List<CharacterEntity>> call(List<int> ids) {
    return repository.getCharacters(ids);
  }
}
