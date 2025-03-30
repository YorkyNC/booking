// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClassState {
  List<ClassEntity>? get classes => throw _privateConstructorUsedError;

  /// Create a copy of ClassState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassStateCopyWith<ClassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassStateCopyWith<$Res> {
  factory $ClassStateCopyWith(
          ClassState value, $Res Function(ClassState) then) =
      _$ClassStateCopyWithImpl<$Res, ClassState>;
  @useResult
  $Res call({List<ClassEntity>? classes});
}

/// @nodoc
class _$ClassStateCopyWithImpl<$Res, $Val extends ClassState>
    implements $ClassStateCopyWith<$Res> {
  _$ClassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classes = freezed,
  }) {
    return _then(_value.copyWith(
      classes: freezed == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassStateImplCopyWith<$Res>
    implements $ClassStateCopyWith<$Res> {
  factory _$$ClassStateImplCopyWith(
          _$ClassStateImpl value, $Res Function(_$ClassStateImpl) then) =
      __$$ClassStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClassEntity>? classes});
}

/// @nodoc
class __$$ClassStateImplCopyWithImpl<$Res>
    extends _$ClassStateCopyWithImpl<$Res, _$ClassStateImpl>
    implements _$$ClassStateImplCopyWith<$Res> {
  __$$ClassStateImplCopyWithImpl(
      _$ClassStateImpl _value, $Res Function(_$ClassStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classes = freezed,
  }) {
    return _then(_$ClassStateImpl(
      classes: freezed == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
    ));
  }
}

/// @nodoc

class _$ClassStateImpl implements _ClassState {
  _$ClassStateImpl({final List<ClassEntity>? classes}) : _classes = classes;

  final List<ClassEntity>? _classes;
  @override
  List<ClassEntity>? get classes {
    final value = _classes;
    if (value == null) return null;
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassState(classes: $classes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassStateImpl &&
            const DeepCollectionEquality().equals(other._classes, _classes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_classes));

  /// Create a copy of ClassState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassStateImplCopyWith<_$ClassStateImpl> get copyWith =>
      __$$ClassStateImplCopyWithImpl<_$ClassStateImpl>(this, _$identity);
}

abstract class _ClassState implements ClassState {
  factory _ClassState({final List<ClassEntity>? classes}) = _$ClassStateImpl;

  @override
  List<ClassEntity>? get classes;

  /// Create a copy of ClassState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassStateImplCopyWith<_$ClassStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
