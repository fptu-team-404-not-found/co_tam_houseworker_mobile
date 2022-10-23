import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/album.dart';
import 'album_presenter.dart';

class AlbumController extends Controller {
  Album? _album;
  Album? get album => _album;
  final AlbumPresenter albumPresenter;

  AlbumController(albumsRepo) : albumPresenter = AlbumPresenter(albumsRepo), super();

  @override
  void initListeners() {
    albumPresenter.getAlbumOnNext = (Album album) {
      print(album.toString());
      _album = album;
      refreshUI();
    };

    albumPresenter.getAlbumOnComplete = () {
      print('Album retrieved');
    };

    albumPresenter.getAlbumOnError = (e) {
      print('Could not retrieved album.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _album = Null as Album;
      refreshUI();
    };
  }

  void getAlbum() => albumPresenter.getAlbum(1);

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    albumPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}