import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  Future<Character> getCharacters({int page = 1}) async {
    try {
      final response = await dio.get(
          '/character', queryParameters: {'page': page});

      return Character.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data?['message'] ??
              e.response?.data?['error'] ??
              'Error desconocido del servidor';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Error inesperado: ${e.toString()}');
    }
  }

}
