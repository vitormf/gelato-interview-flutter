// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _PhotosApi implements PhotosApi {
  _PhotosApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://picsum.photos/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Photo>> getPhotos(page, limit, cancelToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'limit': limit};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Photo>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'list',
                queryParameters: queryParameters,
                data: _data,
                cancelToken: cancelToken)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Photo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
