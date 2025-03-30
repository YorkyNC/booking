// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetectionState {
  List<DetectionDateEntity>? get detection =>
      throw _privateConstructorUsedError;

  /// Create a copy of DetectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionStateCopyWith<DetectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionStateCopyWith<$Res> {
  factory $DetectionStateCopyWith(
          DetectionState value, $Res Function(DetectionState) then) =
      _$DetectionStateCopyWithImpl<$Res, DetectionState>;
  @useResult
  $Res call({List<DetectionDateEntity>? detection});
}

/// @nodoc
class _$DetectionStateCopyWithImpl<$Res, $Val extends DetectionState>
    implements $DetectionStateCopyWith<$Res> {
  _$DetectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detection = freezed,
  }) {
    return _then(_value.copyWith(
      detection: freezed == detection
          ? _value.detection
          : detection // ignore: cast_nullable_to_non_nullable
              as List<DetectionDateEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectionStateImplCopyWith<$Res>
    implements $DetectionStateCopyWith<$Res> {
  factory _$$DetectionStateImplCopyWith(_$DetectionStateImpl value,
          $Res Function(_$DetectionStateImpl) then) =
      __$$DetectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DetectionDateEntity>? detection});
}

/// @nodoc
class __$$DetectionStateImplCopyWithImpl<$Res>
    extends _$DetectionStateCopyWithImpl<$Res, _$DetectionStateImpl>
    implements _$$DetectionStateImplCopyWith<$Res> {
  __$$DetectionStateImplCopyWithImpl(
      _$DetectionStateImpl _value, $Res Function(_$DetectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detection = freezed,
  }) {
    return _then(_$DetectionStateImpl(
      detection: freezed == detection
          ? _value._detection
          : detection // ignore: cast_nullable_to_non_nullable
              as List<DetectionDateEntity>?,
    ));
  }
}

/// @nodoc

class _$DetectionStateImpl implements _DetectionState {
  _$DetectionStateImpl({final List<DetectionDateEntity>? detection})
      : _detection = detection;

  final List<DetectionDateEntity>? _detection;
  @override
  List<DetectionDateEntity>? get detection {
    final value = _detection;
    if (value == null) return null;
    if (_detection is EqualUnmodifiableListView) return _detection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DetectionState(detection: $detection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionStateImpl &&
            const DeepCollectionEquality()
                .equals(other._detection, _detection));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_detection));

  /// Create a copy of DetectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionStateImplCopyWith<_$DetectionStateImpl> get copyWith =>
      __$$DetectionStateImplCopyWithImpl<_$DetectionStateImpl>(
          this, _$identity);
}

abstract class _DetectionState implements DetectionState {
  factory _DetectionState({final List<DetectionDateEntity>? detection}) =
      _$DetectionStateImpl;

  @override
  List<DetectionDateEntity>? get detection;

  /// Create a copy of DetectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionStateImplCopyWith<_$DetectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
