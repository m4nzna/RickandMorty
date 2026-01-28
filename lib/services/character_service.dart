import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  Future<Character> getCharacters({int page = 1, String? name,String? status, String? species, String? type, String? gender}) async {
    try {
      final response = await dio.get(
          '/character', queryParameters: {'page': page, if (name != null && name.isNotEmpty) 'name': name,
          if(status != null && status.isNotEmpty) 'status': status,
          if(species != null && species.isNotEmpty) 'species': species,
          if(type != null && type.isNotEmpty) 'type': type,
          if(gender != null && gender.isNotEmpty) 'gender': gender,
          });

      final data = response.data;

    if (data is Map<String, dynamic> && data.containsKey('error')) {
      throw Exception(data['error']);
    }

    return Character.fromJson(data);
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
