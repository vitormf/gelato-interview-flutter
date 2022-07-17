import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  final String id;
  final String author;
  @JsonKey(name: 'download_url')
  final String image;

  Photo({
    required this.id,
    required this.author,
    required this.image,
  });

  String get thumbnail => "https://picsum.photos/id/$id/100/100";

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
