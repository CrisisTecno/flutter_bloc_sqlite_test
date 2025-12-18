




import '../entities/characterx_entitie.dart';

abstract class ApiItemsRepository {
  Future<List<CharacterEntity>> getCharacters(List<int> ids);
}
