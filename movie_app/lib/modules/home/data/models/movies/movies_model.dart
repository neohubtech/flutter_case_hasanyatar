import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/interfaces/base_model.dart';
import 'package:movie_app/modules/home/data/models/banner_list/banner_list_model.dart';
import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

@freezed
class MoviesModel with _$MoviesModel implements BaseModel {
  const factory MoviesModel({
    List<BannerList>? bannerList,
    List<CombinedList>? combinedList,
  }) = _MoviesModel;

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}
