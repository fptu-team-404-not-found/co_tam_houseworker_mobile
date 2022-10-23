import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/album.dart';
import '../../domain/repositories/albums_repository.dart';

class DataAlbumsRepository extends AlbumsRepository {
  late List<Album> albums;
  //singleton
  static final DataAlbumsRepository _instance = DataAlbumsRepository._internal();
  DataAlbumsRepository._internal() {
    albums = <Album>[];
    albums.addAll([
      const Album(userId: 1, id: 1, title: 't'),
      const Album(userId: 2, id: 2, title: 'i')
    ]);
  }
  factory DataAlbumsRepository() => _instance;

  @override
  Future<Album> getAlbum(int id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    print(response);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<List<Album>> getAllAlbums() async {
    return albums;
  }

}