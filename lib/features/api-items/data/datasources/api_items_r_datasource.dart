import 'package:dio/dio.dart';
import '../models/characterx_model.dart';

abstract class ApiItemsRemoteDataSource {
  Future<List<Characterx>> getCharacters(List<int> ids);
}


class ApiItemsRemoteDataSourceImpl implements ApiItemsRemoteDataSource {
  final Dio dio;

  ApiItemsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Characterx>> getCharacters(List<int> ids) async {
    final idsString = ids.join(',');
    final BASE_URL= 'https://rickandmortyapi.com/api/character/';
    final response = await dio.get(
      '$BASE_URL$idsString',
    );

    if (response.data is List) {
      return (response.data as List)
          .map((json) => Characterx.fromJson(json))
          .toList();
    }

    return [Characterx.fromJson(response.data)];
  }
}
