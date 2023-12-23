// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesModelImpl _$$MoviesModelImplFromJson(Map<String, dynamic> json) =>
    _$MoviesModelImpl(
      bannerList: (json['bannerList'] as List<dynamic>?)
          ?.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
      combinedList: (json['combinedList'] as List<dynamic>?)
          ?.map((e) => CombinedList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MoviesModelImplToJson(_$MoviesModelImpl instance) =>
    <String, dynamic>{
      'bannerList': instance.bannerList,
      'combinedList': instance.combinedList,
    };
