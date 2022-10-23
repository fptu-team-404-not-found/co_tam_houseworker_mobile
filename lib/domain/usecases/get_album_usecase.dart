import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../entities/album.dart';
import '../repositories/albums_repository.dart';

class GetAlbumUseCase
    extends UseCase<GetAlbumUseCaseResponse, GetAlbumUseCaseParams> {
  final AlbumsRepository albumsRepository;
  GetAlbumUseCase(this.albumsRepository);

  @override
  Future<Stream<GetAlbumUseCaseResponse?>> buildUseCaseStream(
      GetAlbumUseCaseParams? params) async {
    final controller = StreamController<GetAlbumUseCaseResponse>();
    try {
      final album = await albumsRepository.getAlbum(1);
      controller.add(GetAlbumUseCaseResponse(album));
      logger.finest('GetAlbumUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetAlbumUseCase unsuccessful.');
      controller.addError(e);
    }

    return controller.stream;
  }
}

class GetAlbumUseCaseParams {
  final int id;
  GetAlbumUseCaseParams(this.id);
}

class GetAlbumUseCaseResponse {
  final Album album;
  GetAlbumUseCaseResponse(this.album);
}