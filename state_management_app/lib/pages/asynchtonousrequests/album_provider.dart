import 'package:flutter/material.dart';
import 'package:state_management_app/pages/asynchtonousrequests/album_api_call.dart';

import 'album_model.dart';

class AlbumProvider with ChangeNotifier {
  List<AlbumModel> _albumList;

  List<AlbumModel> get albumList => _albumList;

  void getAlbums() async {
    try {
      _albumList = await AlbumApiCall().getAlbums();
      notifyListeners();
    } catch (error) {
      print(error);
    } finally {
      print('Finish');
    }
  }
}
