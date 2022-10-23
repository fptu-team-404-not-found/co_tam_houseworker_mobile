import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/data_albums_repository.dart';
import 'album_controller.dart';

class AlbumPage extends View {

  @override
  State<StatefulWidget> createState() => AlbumPageView();

  const AlbumPage({Key? key}) : super(key: key);
}

class AlbumPageView extends ViewState<AlbumPage, AlbumController> {
  AlbumPageView() : super(AlbumController(DataAlbumsRepository()));

  @override
  Widget get view {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Album'),
      ),
      body: Scaffold(
        key:
        globalKey, // built in global key for the ViewState for easy access in the controller
        body: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'The current album is',
              ),
              ControlledWidgetBuilder<AlbumController>(
                builder: (context, controller) {
                  return Text(
                    controller.album == null ? '' : '${controller.album}',
                  );
                },
              ),
              ControlledWidgetBuilder<AlbumController>(
                builder: (context, controller) {
                  return ElevatedButton(
                    onPressed: controller.getAlbum,
                    child: const Text(
                      'Get Album',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          )
        )
      ),
    );
  }
}