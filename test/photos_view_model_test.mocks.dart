// Mocks generated by Mockito 5.2.0 from annotations
// in gelato_photos/test/photos_view_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:dio/dio.dart' as _i5;
import 'package:gelato_photos/model/photo.dart' as _i4;
import 'package:gelato_photos/network/photos_api.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [PhotosApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhotosApi extends _i1.Mock implements _i2.PhotosApi {
  MockPhotosApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Photo>> getPhotos(
          int? page, int? limit, _i5.CancelToken? cancelToken) =>
      (super.noSuchMethod(
              Invocation.method(#getPhotos, [page, limit, cancelToken]),
              returnValue: Future<List<_i4.Photo>>.value(<_i4.Photo>[]))
          as _i3.Future<List<_i4.Photo>>);
}
