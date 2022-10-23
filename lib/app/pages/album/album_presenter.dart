import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/usecases/get_album_usecase.dart';

class AlbumPresenter extends Presenter {
  late Function getAlbumOnNext;
  late Function getAlbumOnComplete;
  late Function getAlbumOnError;

  final GetAlbumUseCase getAlbumUseCase;
  AlbumPresenter(albumsRepo) : getAlbumUseCase = GetAlbumUseCase(albumsRepo);

  void getAlbum(int id) {
    getAlbumUseCase.execute(
        _GetAlbumUseCaseObserver(this), GetAlbumUseCaseParams(id)
    );
  }

  @override
  void dispose() {
    getAlbumUseCase.dispose();
  }

}

class _GetAlbumUseCaseObserver extends Observer<GetAlbumUseCaseResponse> {
  final AlbumPresenter presenter;
  _GetAlbumUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getAlbumOnComplete != null);
    presenter.getAlbumOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getAlbumOnError != null);
    presenter.getAlbumOnError(e);
  }

  @override
  void onNext(GetAlbumUseCaseResponse? response) {
    presenter.getAlbumOnNext(response?.album);
  }

}