import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/interfaces/base_model.dart';

part 'combined_list_model.freezed.dart';
part 'combined_list_model.g.dart';

@freezed
class CombinedList with _$CombinedList implements BaseModel {
  const factory CombinedList({
    String? imageUrl,
    String? type,
    String? name,
    String? explanation,
  }) = _CombinedList;

  factory CombinedList.fromJson(Map<String, dynamic> json) =>
      _$CombinedListFromJson(json);
}
