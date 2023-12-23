// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combined_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CombinedList _$CombinedListFromJson(Map<String, dynamic> json) {
  return _CombinedList.fromJson(json);
}

/// @nodoc
mixin _$CombinedList {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CombinedListCopyWith<CombinedList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CombinedListCopyWith<$Res> {
  factory $CombinedListCopyWith(
          CombinedList value, $Res Function(CombinedList) then) =
      _$CombinedListCopyWithImpl<$Res, CombinedList>;
  @useResult
  $Res call(
      {String? imageUrl, String? type, String? name, String? explanation});
}

/// @nodoc
class _$CombinedListCopyWithImpl<$Res, $Val extends CombinedList>
    implements $CombinedListCopyWith<$Res> {
  _$CombinedListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? explanation = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CombinedListImplCopyWith<$Res>
    implements $CombinedListCopyWith<$Res> {
  factory _$$CombinedListImplCopyWith(
          _$CombinedListImpl value, $Res Function(_$CombinedListImpl) then) =
      __$$CombinedListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? imageUrl, String? type, String? name, String? explanation});
}

/// @nodoc
class __$$CombinedListImplCopyWithImpl<$Res>
    extends _$CombinedListCopyWithImpl<$Res, _$CombinedListImpl>
    implements _$$CombinedListImplCopyWith<$Res> {
  __$$CombinedListImplCopyWithImpl(
      _$CombinedListImpl _value, $Res Function(_$CombinedListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? explanation = freezed,
  }) {
    return _then(_$CombinedListImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CombinedListImpl implements _CombinedList {
  const _$CombinedListImpl(
      {this.imageUrl, this.type, this.name, this.explanation});

  factory _$CombinedListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CombinedListImplFromJson(json);

  @override
  final String? imageUrl;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? explanation;

  @override
  String toString() {
    return 'CombinedList(imageUrl: $imageUrl, type: $type, name: $name, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CombinedListImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imageUrl, type, name, explanation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CombinedListImplCopyWith<_$CombinedListImpl> get copyWith =>
      __$$CombinedListImplCopyWithImpl<_$CombinedListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CombinedListImplToJson(
      this,
    );
  }
}

abstract class _CombinedList implements CombinedList {
  const factory _CombinedList(
      {final String? imageUrl,
      final String? type,
      final String? name,
      final String? explanation}) = _$CombinedListImpl;

  factory _CombinedList.fromJson(Map<String, dynamic> json) =
      _$CombinedListImpl.fromJson;

  @override
  String? get imageUrl;
  @override
  String? get type;
  @override
  String? get name;
  @override
  String? get explanation;
  @override
  @JsonKey(ignore: true)
  _$$CombinedListImplCopyWith<_$CombinedListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
