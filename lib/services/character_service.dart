import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  Future<List<Character>>? getCharacters() async {
    try{
      final response = await dio.get('/character');
      final data = response.data;
      print(response.data);
      return (data['results'] as List).map((e) => Character.fromJson(e)).toList();
    } on DioException catch (e){
      final errorMessage =
          e.response?.data['message'] ??
              e.response?.data['error'] ??
              'Error desconocido del servidor';
      throw Exception(errorMessage);
    }catch (e){
      throw Exception('Error inesperado: ${e.toString()}');
    }
  }
}
