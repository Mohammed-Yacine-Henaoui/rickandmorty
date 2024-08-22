import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/data/web_services/rick_and_morty_web_services.dart';

class AllCharactersRepository {
  late RickAndMortyWebServices rickAndMortyWebServices;

  AllCharactersRepository(RickAndMortyWebServices rickAndMortyWebServices) {
    this.rickAndMortyWebServices = rickAndMortyWebServices;
  }

  Future<dynamic> getAllCharactersFromJson() async {
    var result = await rickAndMortyWebServices.getAllCharacters();
    if (result == "error") {
      return "error";
    } else {
      List<Map<String, dynamic>> resultMaps =
          result.cast<Map<String, dynamic>>();
      List<Character> characters =
          resultMaps.map((character) => Character.fromJson(character)).toList();
      return characters; //return List<Character>
    }
  }
}
