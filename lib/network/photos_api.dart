import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/photo.dart';

part 'photos_api.g.dart';

@RestApi(baseUrl: "https://picsum.photos/v2/")
abstract class PhotosApi {
  factory PhotosApi(Dio dio, {String baseUrl}) = _PhotosApi;

  @GET("list")
  Future<List<Photo>> getPhotos(
      @Query("page") int page, @Query("limit") int limit, @CancelRequest() CancelToken cancelToken);
}
