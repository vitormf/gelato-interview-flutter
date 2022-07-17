import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gelato_photos/model/photo.dart';
import 'package:gelato_photos/network/photos_api.dart';
import 'package:gelato_photos/viewmodel/photos_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'photos_view_model_test.mocks.dart';

@GenerateMocks([PhotosApi])
void main() {
  test("Test PhotosViewModel Success", () async {
    final photosApi = MockPhotosApi();
    when(photosApi.getPhotos(any, any, any)).thenAnswer((_) async {
      return List.generate(10, (index) => Photo(id: index.toString(), author: "author", image: "image"));
    });

    final viewModel = PhotosViewModel(photosApi);
    expect(viewModel.photos.length, 0);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);

    await viewModel.loadNext();
    expect(viewModel.photos.length, 10);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);

    await viewModel.loadNext();
    expect(viewModel.photos.length, 20);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);
  });

  test("Test PhotosViewModel Reset", () async {
    final photosApi = MockPhotosApi();
    when(photosApi.getPhotos(any, any, any)).thenAnswer((_) async {
      return List.generate(10, (index) => Photo(id: index.toString(), author: "author", image: "image"));
    });

    final viewModel = PhotosViewModel(photosApi);
    await viewModel.loadNext();
    await viewModel.loadNext();
    expect(viewModel.photos.length, 20);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);

    await viewModel.reset();

    expect(viewModel.photos.length, 0);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);

    await viewModel.loadNext();
    expect(viewModel.photos.length, 10);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);
  });

  test("Test PhotosViewModel Error", () async {
    final photosApi = MockPhotosApi();
    final error = DioError(requestOptions: RequestOptions(path: ""), type: DioErrorType.other);
    when(photosApi.getPhotos(any, any, any)).thenThrow(error);

    final viewModel = PhotosViewModel(photosApi);
    expect(viewModel.photos.length, 0);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);

    await viewModel.loadNext();
    expect(viewModel.photos.length, 0);
    expect(viewModel.loading, false);
    expect(viewModel.error, true);

    viewModel.dismissError();
    expect(viewModel.photos.length, 0);
    expect(viewModel.loading, false);
    expect(viewModel.error, false);
  });
}
