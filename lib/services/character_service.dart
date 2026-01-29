import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterService {
  CancelToken? cancelToken;
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<Character> getCharacters({
    int page = 1,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    cancelToken?.cancel("New call");
    cancelToken = CancelToken();

    try {
      final response = await dio.get(
        '/character',
        queryParameters: {
          'page': page,
          if (name != null && name.isNotEmpty) 'name': name,
          if (status != null && status.isNotEmpty) 'status': status,
          if (species != null && species.isNotEmpty) 'species': species,
          if (type != null && type.isNotEmpty) 'type': type,
          if (gender != null && gender.isNotEmpty) 'gender': gender,
        },
        cancelToken: cancelToken,
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw Exception('Invalid response format');
      }
      if (!data.containsKey('results')) {
        throw Exception(data['error'] ?? 'No results');
      }

      return Character.fromJson(data);
    } on DioException catch (e) {

        final errorMessage =
            e.response?.data?['message'] ??
                e.response?.data?['error'] ??
                'Error unknown';
        throw Exception(errorMessage);



    } catch (e) {
      throw Exception('Error unexpected: ${e.toString()}');
    }
  }
}
