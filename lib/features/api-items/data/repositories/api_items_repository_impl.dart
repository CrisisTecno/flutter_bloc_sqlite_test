
import '../../domain/domain.dart';
import '../datasources/api_items_r_datasource.dart';

class ApiItemsRepositoryImpl implements ApiItemsRepository {
  final ApiItemsRemoteDataSource remoteDataSource;

  ApiItemsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CharacterEntity>> getCharacters(List<int> ids) async {
    final models = await remoteDataSource.getCharacters(ids);

    return models
        .map(
          (m) => CharacterEntity(
            id: m.id,
            name: m.name,
            image: m.image,
            status: m.status,
            species: m.species,
          ),
        )
        .toList();
  }
}
