import 'package:http/http.dart' as http;
import 'album_model.dart';

abstract class AlbumBase {
  Future<List<AlbumModel>> getAlbums();
}
//Esto es una buena practica de desarrollo ya que esta clase abstracta es parecida a una interfaz solamente que en dart no existen las interfaces, es importante hacer esto para no trabajar
// directamente con la implementacion y cuando necesitemos hacer nuestras pruebas unitarias nos permite inyectar mocks y hacer nuestras pruebas sin problemas


class AlbumApiCall with AlbumBase {
  @override
  Future<List<AlbumModel>> getAlbums() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
//    print(response.statusCode);
    return albumFromJson(response.body);
  }
}