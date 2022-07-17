import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/photo.dart';
import '../network/photos_api.dart';

class PhotosViewModel extends ChangeNotifier {
  final PhotosApi api;
  final List<Photo> _photos = [];
  bool _loading = false;
  bool _error = false;
  var cancelToken = CancelToken();

  int _page = 1;
  static const _limit = 50;

  PhotosViewModel(this.api) {
    loadNext();
  }

  List<Photo> get photos => _photos;
  bool get loading => _loading;
  bool get error => _error;
  bool get initialLoading => loading && photos.isEmpty;

  Future<void> loadNext() async {
    if (!loading) {
      _error = false;
      _loading = true;
      notifyListeners();
      try {
        photos.addAll(await api.getPhotos(_page, _limit, cancelToken));
        _page++;
      } on DioError catch (e) {
        if (e.type != DioErrorType.cancel) {
          _error = true;
        }
      }
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> reset() async {
    _loading = false;
    cancelToken.cancel();
    cancelToken = CancelToken();
    _error = false;
    _photos.clear();
    _page = 1;
    loadNext();
  }

  void dismissError() {
    _error = false;
    notifyListeners();
  }
}
