// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BannerList _$BannerListFromJson(Map<String, dynamic> json) {
  return _BannerList.fromJson(json);
}

/// @nodoc
mixin _$BannerList {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerListCopyWith<BannerList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerListCopyWith<$Res> {
  factory $BannerListCopyWith(
          BannerList value, $Res Function(BannerList) then) =
      _$BannerListCopyWithImpl<$Res, BannerList>;
  @useResult
  $Res call({String? imageUrl, String? name});
}

/// @nodoc
class _$BannerListCopyWithImpl<$Res, $Val extends BannerList>
    implements $BannerListCopyWith<$Res> {
  _$BannerListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerListImplCopyWith<$Res>
    implements $BannerListCopyWith<$Res> {
  factory _$$BannerListImplCopyWith(
          _$BannerListImpl value, $Res Function(_$BannerListImpl) then) =
      __$$BannerListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageUrl, String? name});
}

/// @nodoc
class __$$BannerListImplCopyWithImpl<$Res>
    extends _$BannerListCopyWithImpl<$Res, _$BannerListImpl>
    implements _$$BannerListImplCopyWith<$Res> {
  __$$BannerListImplCopyWithImpl(
      _$BannerListImpl _value, $Res Function(_$BannerListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_$BannerListImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerListImpl implements _BannerList {
  const _$BannerListImpl({this.imageUrl, this.name});

  factory _$BannerListImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerListImplFromJson(json);

  @override
  final String? imageUrl;
  @override
  final String? name;

  @override
  String toString() {
    return 'BannerList(imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerListImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerListImplCopyWith<_$BannerListImpl> get copyWith =>
      __$$BannerListImplCopyWithImpl<_$BannerListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerListImplToJson(
      this,
    );
  }
}

abstract class _BannerList implements BannerList {
  const factory _BannerList({final String? imageUrl, final String? name}) =
      _$BannerListImpl;

  factory _BannerList.fromJson(Map<String, dynamic> json) =
      _$BannerListImpl.fromJson;

  @override
  String? get imageUrl;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$BannerListImplCopyWith<_$BannerListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
