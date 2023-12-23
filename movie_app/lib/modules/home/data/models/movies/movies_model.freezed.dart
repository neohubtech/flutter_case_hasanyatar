// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) {
  return _MoviesModel.fromJson(json);
}

/// @nodoc
mixin _$MoviesModel {
  List<BannerList>? get bannerList => throw _privateConstructorUsedError;
  List<CombinedList>? get combinedList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesModelCopyWith<MoviesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesModelCopyWith<$Res> {
  factory $MoviesModelCopyWith(
          MoviesModel value, $Res Function(MoviesModel) then) =
      _$MoviesModelCopyWithImpl<$Res, MoviesModel>;
  @useResult
  $Res call({List<BannerList>? bannerList, List<CombinedList>? combinedList});
}

/// @nodoc
class _$MoviesModelCopyWithImpl<$Res, $Val extends MoviesModel>
    implements $MoviesModelCopyWith<$Res> {
  _$MoviesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerList = freezed,
    Object? combinedList = freezed,
  }) {
    return _then(_value.copyWith(
      bannerList: freezed == bannerList
          ? _value.bannerList
          : bannerList // ignore: cast_nullable_to_non_nullable
              as List<BannerList>?,
      combinedList: freezed == combinedList
          ? _value.combinedList
          : combinedList // ignore: cast_nullable_to_non_nullable
              as List<CombinedList>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesModelImplCopyWith<$Res>
    implements $MoviesModelCopyWith<$Res> {
  factory _$$MoviesModelImplCopyWith(
          _$MoviesModelImpl value, $Res Function(_$MoviesModelImpl) then) =
      __$$MoviesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BannerList>? bannerList, List<CombinedList>? combinedList});
}

/// @nodoc
class __$$MoviesModelImplCopyWithImpl<$Res>
    extends _$MoviesModelCopyWithImpl<$Res, _$MoviesModelImpl>
    implements _$$MoviesModelImplCopyWith<$Res> {
  __$$MoviesModelImplCopyWithImpl(
      _$MoviesModelImpl _value, $Res Function(_$MoviesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerList = freezed,
    Object? combinedList = freezed,
  }) {
    return _then(_$MoviesModelImpl(
      bannerList: freezed == bannerList
          ? _value._bannerList
          : bannerList // ignore: cast_nullable_to_non_nullable
              as List<BannerList>?,
      combinedList: freezed == combinedList
          ? _value._combinedList
          : combinedList // ignore: cast_nullable_to_non_nullable
              as List<CombinedList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviesModelImpl implements _MoviesModel {
  const _$MoviesModelImpl(
      {final List<BannerList>? bannerList,
      final List<CombinedList>? combinedList})
      : _bannerList = bannerList,
        _combinedList = combinedList;

  factory _$MoviesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviesModelImplFromJson(json);

  final List<BannerList>? _bannerList;
  @override
  List<BannerList>? get bannerList {
    final value = _bannerList;
    if (value == null) return null;
    if (_bannerList is EqualUnmodifiableListView) return _bannerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CombinedList>? _combinedList;
  @override
  List<CombinedList>? get combinedList {
    final value = _combinedList;
    if (value == null) return null;
    if (_combinedList is EqualUnmodifiableListView) return _combinedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MoviesModel(bannerList: $bannerList, combinedList: $combinedList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesModelImpl &&
            const DeepCollectionEquality()
                .equals(other._bannerList, _bannerList) &&
            const DeepCollectionEquality()
                .equals(other._combinedList, _combinedList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bannerList),
      const DeepCollectionEquality().hash(_combinedList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesModelImplCopyWith<_$MoviesModelImpl> get copyWith =>
      __$$MoviesModelImplCopyWithImpl<_$MoviesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviesModelImplToJson(
      this,
    );
  }
}

abstract class _MoviesModel implements MoviesModel {
  const factory _MoviesModel(
      {final List<BannerList>? bannerList,
      final List<CombinedList>? combinedList}) = _$MoviesModelImpl;

  factory _MoviesModel.fromJson(Map<String, dynamic> json) =
      _$MoviesModelImpl.fromJson;

  @override
  List<BannerList>? get bannerList;
  @override
  List<CombinedList>? get combinedList;
  @override
  @JsonKey(ignore: true)
  _$$MoviesModelImplCopyWith<_$MoviesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
