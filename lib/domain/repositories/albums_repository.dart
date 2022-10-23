import '../entities/album.dart';

abstract class AlbumsRepository {
  Future<Album> getAlbum(int id);
  Future<List<Album>> getAllAlbums();
}