import 'package:dio/dio.dart';
import 'package:rickandmorty/others/constants/api_rick_and_morty.dart';

class RickAndMortyWebServices {
  late Dio dio;
  RickAndMortyWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiRickAndMorty.baseUrl,
      receiveDataWhenStatusError: true,
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );

    dio = Dio(options);
  }

  Future<dynamic> getAllCharacters() async {
    Response response;
    List<dynamic> data;
    try {
      response = await dio.get(ApiRickAndMorty.allCharacters);
      if (response.statusCode == 200) {
        data = response.data["results"];
        return data;
      } else {
        return "error";
      }
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }
}
