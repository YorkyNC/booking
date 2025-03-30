// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActionEntity {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  ActionType get actionType => throw _privateConstructorUsedError;
  ActionContext get actionContext => throw _privateConstructorUsedError;
  String? get lessonName => throw _privateConstructorUsedError;

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionEntityCopyWith<ActionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionEntityCopyWith<$Res> {
  factory $ActionEntityCopyWith(
          ActionEntity value, $Res Function(ActionEntity) then) =
      _$ActionEntityCopyWithImpl<$Res, ActionEntity>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      ActionType actionType,
      ActionContext actionContext,
      String? lessonName});
}

/// @nodoc
class _$ActionEntityCopyWithImpl<$Res, $Val extends ActionEntity>
    implements $ActionEntityCopyWith<$Res> {
  _$ActionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? actionType = null,
    Object? actionContext = null,
    Object? lessonName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as ActionType,
      actionContext: null == actionContext
          ? _value.actionContext
          : actionContext // ignore: cast_nullable_to_non_nullable
              as ActionContext,
      lessonName: freezed == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionEntityImplCopyWith<$Res>
    implements $ActionEntityCopyWith<$Res> {
  factory _$$ActionEntityImplCopyWith(
          _$ActionEntityImpl value, $Res Function(_$ActionEntityImpl) then) =
      __$$ActionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      ActionType actionType,
      ActionContext actionContext,
      String? lessonName});
}

/// @nodoc
class __$$ActionEntityImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res, _$ActionEntityImpl>
    implements _$$ActionEntityImplCopyWith<$Res> {
  __$$ActionEntityImplCopyWithImpl(
      _$ActionEntityImpl _value, $Res Function(_$ActionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? actionType = null,
    Object? actionContext = null,
    Object? lessonName = freezed,
  }) {
    return _then(_$ActionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as ActionType,
      actionContext: null == actionContext
          ? _value.actionContext
          : actionContext // ignore: cast_nullable_to_non_nullable
              as ActionContext,
      lessonName: freezed == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ActionEntityImpl implements _ActionEntity {
  _$ActionEntityImpl(
      {required this.id,
      required this.createdAt,
      required this.actionType,
      required this.actionContext,
      this.lessonName});

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final ActionType actionType;
  @override
  final ActionContext actionContext;
  @override
  final String? lessonName;

  @override
  String toString() {
    return 'ActionEntity(id: $id, createdAt: $createdAt, actionType: $actionType, actionContext: $actionContext, lessonName: $lessonName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.actionContext, actionContext) ||
                other.actionContext == actionContext) &&
            (identical(other.lessonName, lessonName) ||
                other.lessonName == lessonName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, actionType, actionContext, lessonName);

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      __$$ActionEntityImplCopyWithImpl<_$ActionEntityImpl>(this, _$identity);
}

abstract class _ActionEntity implements ActionEntity {
  factory _ActionEntity(
      {required final String id,
      required final DateTime createdAt,
      required final ActionType actionType,
      required final ActionContext actionContext,
      final String? lessonName}) = _$ActionEntityImpl;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  ActionType get actionType;
  @override
  ActionContext get actionContext;
  @override
  String? get lessonName;

  /// Create a copy of ActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
