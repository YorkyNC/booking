// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_seat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllSeatEntity _$GetAllSeatEntityFromJson(Map<String, dynamic> json) {
  return _GetAllSeatEntity.fromJson(json);
}

/// @nodoc
mixin _$GetAllSeatEntity {
  List<SeatItemEntity> get data => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this GetAllSeatEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllSeatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllSeatEntityCopyWith<GetAllSeatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllSeatEntityCopyWith<$Res> {
  factory $GetAllSeatEntityCopyWith(
          GetAllSeatEntity value, $Res Function(GetAllSeatEntity) then) =
      _$GetAllSeatEntityCopyWithImpl<$Res, GetAllSeatEntity>;
  @useResult
  $Res call({List<SeatItemEntity> data, int count});
}

/// @nodoc
class _$GetAllSeatEntityCopyWithImpl<$Res, $Val extends GetAllSeatEntity>
    implements $GetAllSeatEntityCopyWith<$Res> {
  _$GetAllSeatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllSeatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SeatItemEntity>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllSeatEntityImplCopyWith<$Res>
    implements $GetAllSeatEntityCopyWith<$Res> {
  factory _$$GetAllSeatEntityImplCopyWith(_$GetAllSeatEntityImpl value,
          $Res Function(_$GetAllSeatEntityImpl) then) =
      __$$GetAllSeatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SeatItemEntity> data, int count});
}

/// @nodoc
class __$$GetAllSeatEntityImplCopyWithImpl<$Res>
    extends _$GetAllSeatEntityCopyWithImpl<$Res, _$GetAllSeatEntityImpl>
    implements _$$GetAllSeatEntityImplCopyWith<$Res> {
  __$$GetAllSeatEntityImplCopyWithImpl(_$GetAllSeatEntityImpl _value,
      $Res Function(_$GetAllSeatEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllSeatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? count = null,
  }) {
    return _then(_$GetAllSeatEntityImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SeatItemEntity>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllSeatEntityImpl implements _GetAllSeatEntity {
  const _$GetAllSeatEntityImpl(
      {required final List<SeatItemEntity> data, required this.count})
      : _data = data;

  factory _$GetAllSeatEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllSeatEntityImplFromJson(json);

  final List<SeatItemEntity> _data;
  @override
  List<SeatItemEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'GetAllSeatEntity(data: $data, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllSeatEntityImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), count);

  /// Create a copy of GetAllSeatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllSeatEntityImplCopyWith<_$GetAllSeatEntityImpl> get copyWith =>
      __$$GetAllSeatEntityImplCopyWithImpl<_$GetAllSeatEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllSeatEntityImplToJson(
      this,
    );
  }
}

abstract class _GetAllSeatEntity implements GetAllSeatEntity {
  const factory _GetAllSeatEntity(
      {required final List<SeatItemEntity> data,
      required final int count}) = _$GetAllSeatEntityImpl;

  factory _GetAllSeatEntity.fromJson(Map<String, dynamic> json) =
      _$GetAllSeatEntityImpl.fromJson;

  @override
  List<SeatItemEntity> get data;
  @override
  int get count;

  /// Create a copy of GetAllSeatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllSeatEntityImplCopyWith<_$GetAllSeatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
