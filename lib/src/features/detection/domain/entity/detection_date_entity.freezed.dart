// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_date_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetectionDateEntity _$DetectionDateEntityFromJson(Map<String, dynamic> json) {
  return _DetectionDateEntity.fromJson(json);
}

/// @nodoc
mixin _$DetectionDateEntity {
  DateTime get date => throw _privateConstructorUsedError;
  List<DetectionEntity> get detections => throw _privateConstructorUsedError;

  /// Serializes this DetectionDateEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectionDateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionDateEntityCopyWith<DetectionDateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionDateEntityCopyWith<$Res> {
  factory $DetectionDateEntityCopyWith(
          DetectionDateEntity value, $Res Function(DetectionDateEntity) then) =
      _$DetectionDateEntityCopyWithImpl<$Res, DetectionDateEntity>;
  @useResult
  $Res call({DateTime date, List<DetectionEntity> detections});
}

/// @nodoc
class _$DetectionDateEntityCopyWithImpl<$Res, $Val extends DetectionDateEntity>
    implements $DetectionDateEntityCopyWith<$Res> {
  _$DetectionDateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionDateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? detections = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      detections: null == detections
          ? _value.detections
          : detections // ignore: cast_nullable_to_non_nullable
              as List<DetectionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectionDateEntityImplCopyWith<$Res>
    implements $DetectionDateEntityCopyWith<$Res> {
  factory _$$DetectionDateEntityImplCopyWith(_$DetectionDateEntityImpl value,
          $Res Function(_$DetectionDateEntityImpl) then) =
      __$$DetectionDateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<DetectionEntity> detections});
}

/// @nodoc
class __$$DetectionDateEntityImplCopyWithImpl<$Res>
    extends _$DetectionDateEntityCopyWithImpl<$Res, _$DetectionDateEntityImpl>
    implements _$$DetectionDateEntityImplCopyWith<$Res> {
  __$$DetectionDateEntityImplCopyWithImpl(_$DetectionDateEntityImpl _value,
      $Res Function(_$DetectionDateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectionDateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? detections = null,
  }) {
    return _then(_$DetectionDateEntityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      detections: null == detections
          ? _value._detections
          : detections // ignore: cast_nullable_to_non_nullable
              as List<DetectionEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectionDateEntityImpl implements _DetectionDateEntity {
  _$DetectionDateEntityImpl(
      {required this.date, required final List<DetectionEntity> detections})
      : _detections = detections;

  factory _$DetectionDateEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectionDateEntityImplFromJson(json);

  @override
  final DateTime date;
  final List<DetectionEntity> _detections;
  @override
  List<DetectionEntity> get detections {
    if (_detections is EqualUnmodifiableListView) return _detections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detections);
  }

  @override
  String toString() {
    return 'DetectionDateEntity(date: $date, detections: $detections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionDateEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._detections, _detections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_detections));

  /// Create a copy of DetectionDateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionDateEntityImplCopyWith<_$DetectionDateEntityImpl> get copyWith =>
      __$$DetectionDateEntityImplCopyWithImpl<_$DetectionDateEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectionDateEntityImplToJson(
      this,
    );
  }
}

abstract class _DetectionDateEntity implements DetectionDateEntity {
  factory _DetectionDateEntity(
          {required final DateTime date,
          required final List<DetectionEntity> detections}) =
      _$DetectionDateEntityImpl;

  factory _DetectionDateEntity.fromJson(Map<String, dynamic> json) =
      _$DetectionDateEntityImpl.fromJson;

  @override
  DateTime get date;
  @override
  List<DetectionEntity> get detections;

  /// Create a copy of DetectionDateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionDateEntityImplCopyWith<_$DetectionDateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
