import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/interfaces/base_model.dart';

part 'banner_list_model.freezed.dart';
part 'banner_list_model.g.dart';

@freezed
class BannerList with _$BannerList implements BaseModel {
  const factory BannerList({
    String? imageUrl,
    String? name,
  }) = _BannerList;

  factory BannerList.fromJson(Map<String, dynamic> json) =>
      _$BannerListFromJson(json);
}
