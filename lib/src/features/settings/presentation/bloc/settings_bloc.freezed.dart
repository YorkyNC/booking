// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() retrieve,
    required TResult Function(String languageCode) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? retrieve,
    TResult? Function(String languageCode)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? retrieve,
    TResult Function(String languageCode)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RetrieveSettingsEvent value) retrieve,
    required TResult Function(_UpdateSettingsEvent value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RetrieveSettingsEvent value)? retrieve,
    TResult? Function(_UpdateSettingsEvent value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RetrieveSettingsEvent value)? retrieve,
    TResult Function(_UpdateSettingsEvent value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RetrieveSettingsEventImplCopyWith<$Res> {
  factory _$$RetrieveSettingsEventImplCopyWith(
          _$RetrieveSettingsEventImpl value,
          $Res Function(_$RetrieveSettingsEventImpl) then) =
      __$$RetrieveSettingsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetrieveSettingsEventImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$RetrieveSettingsEventImpl>
    implements _$$RetrieveSettingsEventImplCopyWith<$Res> {
  __$$RetrieveSettingsEventImplCopyWithImpl(_$RetrieveSettingsEventImpl _value,
      $Res Function(_$RetrieveSettingsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RetrieveSettingsEventImpl implements _RetrieveSettingsEvent {
  const _$RetrieveSettingsEventImpl();

  @override
  String toString() {
    return 'SettingsEvent.retrieve()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetrieveSettingsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() retrieve,
    required TResult Function(String languageCode) update,
  }) {
    return retrieve();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? retrieve,
    TResult? Function(String languageCode)? update,
  }) {
    return retrieve?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? retrieve,
    TResult Function(String languageCode)? update,
    required TResult orElse(),
  }) {
    if (retrieve != null) {
      return retrieve();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RetrieveSettingsEvent value) retrieve,
    required TResult Function(_UpdateSettingsEvent value) update,
  }) {
    return retrieve(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RetrieveSettingsEvent value)? retrieve,
    TResult? Function(_UpdateSettingsEvent value)? update,
  }) {
    return retrieve?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RetrieveSettingsEvent value)? retrieve,
    TResult Function(_UpdateSettingsEvent value)? update,
    required TResult orElse(),
  }) {
    if (retrieve != null) {
      return retrieve(this);
    }
    return orElse();
  }
}

abstract class _RetrieveSettingsEvent implements SettingsEvent {
  const factory _RetrieveSettingsEvent() = _$RetrieveSettingsEventImpl;
}

/// @nodoc
abstract class _$$UpdateSettingsEventImplCopyWith<$Res> {
  factory _$$UpdateSettingsEventImplCopyWith(_$UpdateSettingsEventImpl value,
          $Res Function(_$UpdateSettingsEventImpl) then) =
      __$$UpdateSettingsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class __$$UpdateSettingsEventImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$UpdateSettingsEventImpl>
    implements _$$UpdateSettingsEventImplCopyWith<$Res> {
  __$$UpdateSettingsEventImplCopyWithImpl(_$UpdateSettingsEventImpl _value,
      $Res Function(_$UpdateSettingsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_$UpdateSettingsEventImpl(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSettingsEventImpl implements _UpdateSettingsEvent {
  const _$UpdateSettingsEventImpl({required this.languageCode});

  @override
  final String languageCode;

  @override
  String toString() {
    return 'SettingsEvent.update(languageCode: $languageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSettingsEventImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSettingsEventImplCopyWith<_$UpdateSettingsEventImpl> get copyWith =>
      __$$UpdateSettingsEventImplCopyWithImpl<_$UpdateSettingsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() retrieve,
    required TResult Function(String languageCode) update,
  }) {
    return update(languageCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? retrieve,
    TResult? Function(String languageCode)? update,
  }) {
    return update?.call(languageCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? retrieve,
    TResult Function(String languageCode)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(languageCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RetrieveSettingsEvent value) retrieve,
    required TResult Function(_UpdateSettingsEvent value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RetrieveSettingsEvent value)? retrieve,
    TResult? Function(_UpdateSettingsEvent value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RetrieveSettingsEvent value)? retrieve,
    TResult Function(_UpdateSettingsEvent value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateSettingsEvent implements SettingsEvent {
  const factory _UpdateSettingsEvent({required final String languageCode}) =
      _$UpdateSettingsEventImpl;

  String get languageCode;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSettingsEventImplCopyWith<_$UpdateSettingsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() inProgress,
    required TResult Function(SettingsViewModel viewModel) done,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? inProgress,
    TResult? Function(SettingsViewModel viewModel)? done,
    TResult? Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? inProgress,
    TResult Function(SettingsViewModel viewModel)? done,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptySettingsState value) empty,
    required TResult Function(_InProgressSettingsState value) inProgress,
    required TResult Function(_DoneSettingsState value) done,
    required TResult Function(_ErrorSettingsState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptySettingsState value)? empty,
    TResult? Function(_InProgressSettingsState value)? inProgress,
    TResult? Function(_DoneSettingsState value)? done,
    TResult? Function(_ErrorSettingsState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptySettingsState value)? empty,
    TResult Function(_InProgressSettingsState value)? inProgress,
    TResult Function(_DoneSettingsState value)? done,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmptySettingsStateImplCopyWith<$Res> {
  factory _$$EmptySettingsStateImplCopyWith(_$EmptySettingsStateImpl value,
          $Res Function(_$EmptySettingsStateImpl) then) =
      __$$EmptySettingsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptySettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$EmptySettingsStateImpl>
    implements _$$EmptySettingsStateImplCopyWith<$Res> {
  __$$EmptySettingsStateImplCopyWithImpl(_$EmptySettingsStateImpl _value,
      $Res Function(_$EmptySettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptySettingsStateImpl implements _EmptySettingsState {
  const _$EmptySettingsStateImpl();

  @override
  String toString() {
    return 'SettingsState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptySettingsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() inProgress,
    required TResult Function(SettingsViewModel viewModel) done,
    required TResult Function(String errorMessage) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? inProgress,
    TResult? Function(SettingsViewModel viewModel)? done,
    TResult? Function(String errorMessage)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? inProgress,
    TResult Function(SettingsViewModel viewModel)? done,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptySettingsState value) empty,
    required TResult Function(_InProgressSettingsState value) inProgress,
    required TResult Function(_DoneSettingsState value) done,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptySettingsState value)? empty,
    TResult? Function(_InProgressSettingsState value)? inProgress,
    TResult? Function(_DoneSettingsState value)? done,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptySettingsState value)? empty,
    TResult Function(_InProgressSettingsState value)? inProgress,
    TResult Function(_DoneSettingsState value)? done,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmptySettingsState implements SettingsState {
  const factory _EmptySettingsState() = _$EmptySettingsStateImpl;
}

/// @nodoc
abstract class _$$InProgressSettingsStateImplCopyWith<$Res> {
  factory _$$InProgressSettingsStateImplCopyWith(
          _$InProgressSettingsStateImpl value,
          $Res Function(_$InProgressSettingsStateImpl) then) =
      __$$InProgressSettingsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InProgressSettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$InProgressSettingsStateImpl>
    implements _$$InProgressSettingsStateImplCopyWith<$Res> {
  __$$InProgressSettingsStateImplCopyWithImpl(
      _$InProgressSettingsStateImpl _value,
      $Res Function(_$InProgressSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InProgressSettingsStateImpl implements _InProgressSettingsState {
  const _$InProgressSettingsStateImpl();

  @override
  String toString() {
    return 'SettingsState.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressSettingsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() inProgress,
    required TResult Function(SettingsViewModel viewModel) done,
    required TResult Function(String errorMessage) error,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? inProgress,
    TResult? Function(SettingsViewModel viewModel)? done,
    TResult? Function(String errorMessage)? error,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? inProgress,
    TResult Function(SettingsViewModel viewModel)? done,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptySettingsState value) empty,
    required TResult Function(_InProgressSettingsState value) inProgress,
    required TResult Function(_DoneSettingsState value) done,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptySettingsState value)? empty,
    TResult? Function(_InProgressSettingsState value)? inProgress,
    TResult? Function(_DoneSettingsState value)? done,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptySettingsState value)? empty,
    TResult Function(_InProgressSettingsState value)? inProgress,
    TResult Function(_DoneSettingsState value)? done,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgressSettingsState implements SettingsState {
  const factory _InProgressSettingsState() = _$InProgressSettingsStateImpl;
}

/// @nodoc
abstract class _$$DoneSettingsStateImplCopyWith<$Res> {
  factory _$$DoneSettingsStateImplCopyWith(_$DoneSettingsStateImpl value,
          $Res Function(_$DoneSettingsStateImpl) then) =
      __$$DoneSettingsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SettingsViewModel viewModel});

  $SettingsViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$DoneSettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$DoneSettingsStateImpl>
    implements _$$DoneSettingsStateImplCopyWith<$Res> {
  __$$DoneSettingsStateImplCopyWithImpl(_$DoneSettingsStateImpl _value,
      $Res Function(_$DoneSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewModel = null,
  }) {
    return _then(_$DoneSettingsStateImpl(
      null == viewModel
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as SettingsViewModel,
    ));
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsViewModelCopyWith<$Res> get viewModel {
    return $SettingsViewModelCopyWith<$Res>(_value.viewModel, (value) {
      return _then(_value.copyWith(viewModel: value));
    });
  }
}

/// @nodoc

class _$DoneSettingsStateImpl implements _DoneSettingsState {
  const _$DoneSettingsStateImpl(this.viewModel);

  @override
  final SettingsViewModel viewModel;

  @override
  String toString() {
    return 'SettingsState.done(viewModel: $viewModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneSettingsStateImpl &&
            (identical(other.viewModel, viewModel) ||
                other.viewModel == viewModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewModel);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoneSettingsStateImplCopyWith<_$DoneSettingsStateImpl> get copyWith =>
      __$$DoneSettingsStateImplCopyWithImpl<_$DoneSettingsStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() inProgress,
    required TResult Function(SettingsViewModel viewModel) done,
    required TResult Function(String errorMessage) error,
  }) {
    return done(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? inProgress,
    TResult? Function(SettingsViewModel viewModel)? done,
    TResult? Function(String errorMessage)? error,
  }) {
    return done?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? inProgress,
    TResult Function(SettingsViewModel viewModel)? done,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptySettingsState value) empty,
    required TResult Function(_InProgressSettingsState value) inProgress,
    required TResult Function(_DoneSettingsState value) done,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptySettingsState value)? empty,
    TResult? Function(_InProgressSettingsState value)? inProgress,
    TResult? Function(_DoneSettingsState value)? done,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptySettingsState value)? empty,
    TResult Function(_InProgressSettingsState value)? inProgress,
    TResult Function(_DoneSettingsState value)? done,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _DoneSettingsState implements SettingsState {
  const factory _DoneSettingsState(final SettingsViewModel viewModel) =
      _$DoneSettingsStateImpl;

  SettingsViewModel get viewModel;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoneSettingsStateImplCopyWith<_$DoneSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorSettingsStateImplCopyWith<$Res> {
  factory _$$ErrorSettingsStateImplCopyWith(_$ErrorSettingsStateImpl value,
          $Res Function(_$ErrorSettingsStateImpl) then) =
      __$$ErrorSettingsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ErrorSettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$ErrorSettingsStateImpl>
    implements _$$ErrorSettingsStateImplCopyWith<$Res> {
  __$$ErrorSettingsStateImplCopyWithImpl(_$ErrorSettingsStateImpl _value,
      $Res Function(_$ErrorSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorSettingsStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorSettingsStateImpl implements _ErrorSettingsState {
  const _$ErrorSettingsStateImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SettingsState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSettingsStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSettingsStateImplCopyWith<_$ErrorSettingsStateImpl> get copyWith =>
      __$$ErrorSettingsStateImplCopyWithImpl<_$ErrorSettingsStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() inProgress,
    required TResult Function(SettingsViewModel viewModel) done,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? inProgress,
    TResult? Function(SettingsViewModel viewModel)? done,
    TResult? Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? inProgress,
    TResult Function(SettingsViewModel viewModel)? done,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptySettingsState value) empty,
    required TResult Function(_InProgressSettingsState value) inProgress,
    required TResult Function(_DoneSettingsState value) done,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptySettingsState value)? empty,
    TResult? Function(_InProgressSettingsState value)? inProgress,
    TResult? Function(_DoneSettingsState value)? done,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptySettingsState value)? empty,
    TResult Function(_InProgressSettingsState value)? inProgress,
    TResult Function(_DoneSettingsState value)? done,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorSettingsState implements SettingsState {
  const factory _ErrorSettingsState({required final String errorMessage}) =
      _$ErrorSettingsStateImpl;

  String get errorMessage;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSettingsStateImplCopyWith<_$ErrorSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsViewModel {
  String get languageCode => throw _privateConstructorUsedError;

  /// Create a copy of SettingsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsViewModelCopyWith<SettingsViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsViewModelCopyWith<$Res> {
  factory $SettingsViewModelCopyWith(
          SettingsViewModel value, $Res Function(SettingsViewModel) then) =
      _$SettingsViewModelCopyWithImpl<$Res, SettingsViewModel>;
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class _$SettingsViewModelCopyWithImpl<$Res, $Val extends SettingsViewModel>
    implements $SettingsViewModelCopyWith<$Res> {
  _$SettingsViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsViewModelImplCopyWith<$Res>
    implements $SettingsViewModelCopyWith<$Res> {
  factory _$$SettingsViewModelImplCopyWith(_$SettingsViewModelImpl value,
          $Res Function(_$SettingsViewModelImpl) then) =
      __$$SettingsViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class __$$SettingsViewModelImplCopyWithImpl<$Res>
    extends _$SettingsViewModelCopyWithImpl<$Res, _$SettingsViewModelImpl>
    implements _$$SettingsViewModelImplCopyWith<$Res> {
  __$$SettingsViewModelImplCopyWithImpl(_$SettingsViewModelImpl _value,
      $Res Function(_$SettingsViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_$SettingsViewModelImpl(
      null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingsViewModelImpl implements _SettingsViewModel {
  const _$SettingsViewModelImpl(this.languageCode);

  @override
  final String languageCode;

  @override
  String toString() {
    return 'SettingsViewModel(languageCode: $languageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsViewModelImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  /// Create a copy of SettingsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsViewModelImplCopyWith<_$SettingsViewModelImpl> get copyWith =>
      __$$SettingsViewModelImplCopyWithImpl<_$SettingsViewModelImpl>(
          this, _$identity);
}

abstract class _SettingsViewModel implements SettingsViewModel {
  const factory _SettingsViewModel(final String languageCode) =
      _$SettingsViewModelImpl;

  @override
  String get languageCode;

  /// Create a copy of SettingsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsViewModelImplCopyWith<_$SettingsViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
