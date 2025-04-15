// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GetAllSeatRequest request) getAll,
    required TResult Function(GetSeatRequest request) getSeat,
    required TResult Function(CreateReservationRequest request)
        createReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GetAllSeatRequest request)? getAll,
    TResult? Function(GetSeatRequest request)? getSeat,
    TResult? Function(CreateReservationRequest request)? createReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GetAllSeatRequest request)? getAll,
    TResult Function(GetSeatRequest request)? getSeat,
    TResult Function(CreateReservationRequest request)? createReservation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllSeat value) getAll,
    required TResult Function(_GetSeat value) getSeat,
    required TResult Function(_CreateReservation value) createReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllSeat value)? getAll,
    TResult? Function(_GetSeat value)? getSeat,
    TResult? Function(_CreateReservation value)? createReservation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllSeat value)? getAll,
    TResult Function(_GetSeat value)? getSeat,
    TResult Function(_CreateReservation value)? createReservation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeatEventCopyWith<$Res> {
  factory $SeatEventCopyWith(SeatEvent value, $Res Function(SeatEvent) then) =
      _$SeatEventCopyWithImpl<$Res, SeatEvent>;
}

/// @nodoc
class _$SeatEventCopyWithImpl<$Res, $Val extends SeatEvent>
    implements $SeatEventCopyWith<$Res> {
  _$SeatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SeatEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SeatEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GetAllSeatRequest request) getAll,
    required TResult Function(GetSeatRequest request) getSeat,
    required TResult Function(CreateReservationRequest request)
        createReservation,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GetAllSeatRequest request)? getAll,
    TResult? Function(GetSeatRequest request)? getSeat,
    TResult? Function(CreateReservationRequest request)? createReservation,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GetAllSeatRequest request)? getAll,
    TResult Function(GetSeatRequest request)? getSeat,
    TResult Function(CreateReservationRequest request)? createReservation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllSeat value) getAll,
    required TResult Function(_GetSeat value) getSeat,
    required TResult Function(_CreateReservation value) createReservation,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllSeat value)? getAll,
    TResult? Function(_GetSeat value)? getSeat,
    TResult? Function(_CreateReservation value)? createReservation,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllSeat value)? getAll,
    TResult Function(_GetSeat value)? getSeat,
    TResult Function(_CreateReservation value)? createReservation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SeatEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetAllSeatImplCopyWith<$Res> {
  factory _$$GetAllSeatImplCopyWith(
          _$GetAllSeatImpl value, $Res Function(_$GetAllSeatImpl) then) =
      __$$GetAllSeatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetAllSeatRequest request});

  $GetAllSeatRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$GetAllSeatImplCopyWithImpl<$Res>
    extends _$SeatEventCopyWithImpl<$Res, _$GetAllSeatImpl>
    implements _$$GetAllSeatImplCopyWith<$Res> {
  __$$GetAllSeatImplCopyWithImpl(
      _$GetAllSeatImpl _value, $Res Function(_$GetAllSeatImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$GetAllSeatImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GetAllSeatRequest,
    ));
  }

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetAllSeatRequestCopyWith<$Res> get request {
    return $GetAllSeatRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$GetAllSeatImpl implements _GetAllSeat {
  const _$GetAllSeatImpl(this.request);

  @override
  final GetAllSeatRequest request;

  @override
  String toString() {
    return 'SeatEvent.getAll(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllSeatImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllSeatImplCopyWith<_$GetAllSeatImpl> get copyWith =>
      __$$GetAllSeatImplCopyWithImpl<_$GetAllSeatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GetAllSeatRequest request) getAll,
    required TResult Function(GetSeatRequest request) getSeat,
    required TResult Function(CreateReservationRequest request)
        createReservation,
  }) {
    return getAll(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GetAllSeatRequest request)? getAll,
    TResult? Function(GetSeatRequest request)? getSeat,
    TResult? Function(CreateReservationRequest request)? createReservation,
  }) {
    return getAll?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GetAllSeatRequest request)? getAll,
    TResult Function(GetSeatRequest request)? getSeat,
    TResult Function(CreateReservationRequest request)? createReservation,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllSeat value) getAll,
    required TResult Function(_GetSeat value) getSeat,
    required TResult Function(_CreateReservation value) createReservation,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllSeat value)? getAll,
    TResult? Function(_GetSeat value)? getSeat,
    TResult? Function(_CreateReservation value)? createReservation,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllSeat value)? getAll,
    TResult Function(_GetSeat value)? getSeat,
    TResult Function(_CreateReservation value)? createReservation,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class _GetAllSeat implements SeatEvent {
  const factory _GetAllSeat(final GetAllSeatRequest request) = _$GetAllSeatImpl;

  GetAllSeatRequest get request;

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllSeatImplCopyWith<_$GetAllSeatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSeatImplCopyWith<$Res> {
  factory _$$GetSeatImplCopyWith(
          _$GetSeatImpl value, $Res Function(_$GetSeatImpl) then) =
      __$$GetSeatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetSeatRequest request});

  $GetSeatRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$GetSeatImplCopyWithImpl<$Res>
    extends _$SeatEventCopyWithImpl<$Res, _$GetSeatImpl>
    implements _$$GetSeatImplCopyWith<$Res> {
  __$$GetSeatImplCopyWithImpl(
      _$GetSeatImpl _value, $Res Function(_$GetSeatImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$GetSeatImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GetSeatRequest,
    ));
  }

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetSeatRequestCopyWith<$Res> get request {
    return $GetSeatRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$GetSeatImpl implements _GetSeat {
  const _$GetSeatImpl(this.request);

  @override
  final GetSeatRequest request;

  @override
  String toString() {
    return 'SeatEvent.getSeat(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSeatImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSeatImplCopyWith<_$GetSeatImpl> get copyWith =>
      __$$GetSeatImplCopyWithImpl<_$GetSeatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GetAllSeatRequest request) getAll,
    required TResult Function(GetSeatRequest request) getSeat,
    required TResult Function(CreateReservationRequest request)
        createReservation,
  }) {
    return getSeat(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GetAllSeatRequest request)? getAll,
    TResult? Function(GetSeatRequest request)? getSeat,
    TResult? Function(CreateReservationRequest request)? createReservation,
  }) {
    return getSeat?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GetAllSeatRequest request)? getAll,
    TResult Function(GetSeatRequest request)? getSeat,
    TResult Function(CreateReservationRequest request)? createReservation,
    required TResult orElse(),
  }) {
    if (getSeat != null) {
      return getSeat(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllSeat value) getAll,
    required TResult Function(_GetSeat value) getSeat,
    required TResult Function(_CreateReservation value) createReservation,
  }) {
    return getSeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllSeat value)? getAll,
    TResult? Function(_GetSeat value)? getSeat,
    TResult? Function(_CreateReservation value)? createReservation,
  }) {
    return getSeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllSeat value)? getAll,
    TResult Function(_GetSeat value)? getSeat,
    TResult Function(_CreateReservation value)? createReservation,
    required TResult orElse(),
  }) {
    if (getSeat != null) {
      return getSeat(this);
    }
    return orElse();
  }
}

abstract class _GetSeat implements SeatEvent {
  const factory _GetSeat(final GetSeatRequest request) = _$GetSeatImpl;

  GetSeatRequest get request;

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSeatImplCopyWith<_$GetSeatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateReservationImplCopyWith<$Res> {
  factory _$$CreateReservationImplCopyWith(_$CreateReservationImpl value,
          $Res Function(_$CreateReservationImpl) then) =
      __$$CreateReservationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateReservationRequest request});

  $CreateReservationRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$CreateReservationImplCopyWithImpl<$Res>
    extends _$SeatEventCopyWithImpl<$Res, _$CreateReservationImpl>
    implements _$$CreateReservationImplCopyWith<$Res> {
  __$$CreateReservationImplCopyWithImpl(_$CreateReservationImpl _value,
      $Res Function(_$CreateReservationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$CreateReservationImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateReservationRequest,
    ));
  }

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateReservationRequestCopyWith<$Res> get request {
    return $CreateReservationRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$CreateReservationImpl implements _CreateReservation {
  const _$CreateReservationImpl(this.request);

  @override
  final CreateReservationRequest request;

  @override
  String toString() {
    return 'SeatEvent.createReservation(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReservationImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReservationImplCopyWith<_$CreateReservationImpl> get copyWith =>
      __$$CreateReservationImplCopyWithImpl<_$CreateReservationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GetAllSeatRequest request) getAll,
    required TResult Function(GetSeatRequest request) getSeat,
    required TResult Function(CreateReservationRequest request)
        createReservation,
  }) {
    return createReservation(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GetAllSeatRequest request)? getAll,
    TResult? Function(GetSeatRequest request)? getSeat,
    TResult? Function(CreateReservationRequest request)? createReservation,
  }) {
    return createReservation?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GetAllSeatRequest request)? getAll,
    TResult Function(GetSeatRequest request)? getSeat,
    TResult Function(CreateReservationRequest request)? createReservation,
    required TResult orElse(),
  }) {
    if (createReservation != null) {
      return createReservation(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllSeat value) getAll,
    required TResult Function(_GetSeat value) getSeat,
    required TResult Function(_CreateReservation value) createReservation,
  }) {
    return createReservation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllSeat value)? getAll,
    TResult? Function(_GetSeat value)? getSeat,
    TResult? Function(_CreateReservation value)? createReservation,
  }) {
    return createReservation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllSeat value)? getAll,
    TResult Function(_GetSeat value)? getSeat,
    TResult Function(_CreateReservation value)? createReservation,
    required TResult orElse(),
  }) {
    if (createReservation != null) {
      return createReservation(this);
    }
    return orElse();
  }
}

abstract class _CreateReservation implements SeatEvent {
  const factory _CreateReservation(final CreateReservationRequest request) =
      _$CreateReservationImpl;

  CreateReservationRequest get request;

  /// Create a copy of SeatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReservationImplCopyWith<_$CreateReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SeatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SeatViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SeatViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SeatViewModel viewModel)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeatStateCopyWith<$Res> {
  factory $SeatStateCopyWith(SeatState value, $Res Function(SeatState) then) =
      _$SeatStateCopyWithImpl<$Res, SeatState>;
}

/// @nodoc
class _$SeatStateCopyWithImpl<$Res, $Val extends SeatState>
    implements $SeatStateCopyWith<$Res> {
  _$SeatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SeatStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SeatState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SeatViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SeatViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SeatViewModel viewModel)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SeatState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SeatViewModel viewModel});

  $SeatViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SeatStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewModel = null,
  }) {
    return _then(_$LoadedImpl(
      viewModel: null == viewModel
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as SeatViewModel,
    ));
  }

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeatViewModelCopyWith<$Res> get viewModel {
    return $SeatViewModelCopyWith<$Res>(_value.viewModel, (value) {
      return _then(_value.copyWith(viewModel: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.viewModel});

  @override
  final SeatViewModel viewModel;

  @override
  String toString() {
    return 'SeatState.loaded(viewModel: $viewModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.viewModel, viewModel) ||
                other.viewModel == viewModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewModel);

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SeatViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SeatViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SeatViewModel viewModel)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SeatState {
  const factory _Loaded({required final SeatViewModel viewModel}) =
      _$LoadedImpl;

  SeatViewModel get viewModel;

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SeatStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SeatState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(SeatViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(SeatViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(SeatViewModel viewModel)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SeatState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of SeatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SeatViewModel {
  GetAllSeatEntity? get allSeat => throw _privateConstructorUsedError;
  SeatItemEntity? get seat => throw _privateConstructorUsedError;
  CreateReservationEntity? get reservation =>
      throw _privateConstructorUsedError;

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeatViewModelCopyWith<SeatViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeatViewModelCopyWith<$Res> {
  factory $SeatViewModelCopyWith(
          SeatViewModel value, $Res Function(SeatViewModel) then) =
      _$SeatViewModelCopyWithImpl<$Res, SeatViewModel>;
  @useResult
  $Res call(
      {GetAllSeatEntity? allSeat,
      SeatItemEntity? seat,
      CreateReservationEntity? reservation});

  $GetAllSeatEntityCopyWith<$Res>? get allSeat;
  $SeatItemEntityCopyWith<$Res>? get seat;
  $CreateReservationEntityCopyWith<$Res>? get reservation;
}

/// @nodoc
class _$SeatViewModelCopyWithImpl<$Res, $Val extends SeatViewModel>
    implements $SeatViewModelCopyWith<$Res> {
  _$SeatViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSeat = freezed,
    Object? seat = freezed,
    Object? reservation = freezed,
  }) {
    return _then(_value.copyWith(
      allSeat: freezed == allSeat
          ? _value.allSeat
          : allSeat // ignore: cast_nullable_to_non_nullable
              as GetAllSeatEntity?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as SeatItemEntity?,
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as CreateReservationEntity?,
    ) as $Val);
  }

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetAllSeatEntityCopyWith<$Res>? get allSeat {
    if (_value.allSeat == null) {
      return null;
    }

    return $GetAllSeatEntityCopyWith<$Res>(_value.allSeat!, (value) {
      return _then(_value.copyWith(allSeat: value) as $Val);
    });
  }

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeatItemEntityCopyWith<$Res>? get seat {
    if (_value.seat == null) {
      return null;
    }

    return $SeatItemEntityCopyWith<$Res>(_value.seat!, (value) {
      return _then(_value.copyWith(seat: value) as $Val);
    });
  }

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateReservationEntityCopyWith<$Res>? get reservation {
    if (_value.reservation == null) {
      return null;
    }

    return $CreateReservationEntityCopyWith<$Res>(_value.reservation!, (value) {
      return _then(_value.copyWith(reservation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeatViewModelImplCopyWith<$Res>
    implements $SeatViewModelCopyWith<$Res> {
  factory _$$SeatViewModelImplCopyWith(
          _$SeatViewModelImpl value, $Res Function(_$SeatViewModelImpl) then) =
      __$$SeatViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GetAllSeatEntity? allSeat,
      SeatItemEntity? seat,
      CreateReservationEntity? reservation});

  @override
  $GetAllSeatEntityCopyWith<$Res>? get allSeat;
  @override
  $SeatItemEntityCopyWith<$Res>? get seat;
  @override
  $CreateReservationEntityCopyWith<$Res>? get reservation;
}

/// @nodoc
class __$$SeatViewModelImplCopyWithImpl<$Res>
    extends _$SeatViewModelCopyWithImpl<$Res, _$SeatViewModelImpl>
    implements _$$SeatViewModelImplCopyWith<$Res> {
  __$$SeatViewModelImplCopyWithImpl(
      _$SeatViewModelImpl _value, $Res Function(_$SeatViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSeat = freezed,
    Object? seat = freezed,
    Object? reservation = freezed,
  }) {
    return _then(_$SeatViewModelImpl(
      allSeat: freezed == allSeat
          ? _value.allSeat
          : allSeat // ignore: cast_nullable_to_non_nullable
              as GetAllSeatEntity?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as SeatItemEntity?,
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as CreateReservationEntity?,
    ));
  }
}

/// @nodoc

class _$SeatViewModelImpl implements _SeatViewModel {
  const _$SeatViewModelImpl({this.allSeat, this.seat, this.reservation});

  @override
  final GetAllSeatEntity? allSeat;
  @override
  final SeatItemEntity? seat;
  @override
  final CreateReservationEntity? reservation;

  @override
  String toString() {
    return 'SeatViewModel(allSeat: $allSeat, seat: $seat, reservation: $reservation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeatViewModelImpl &&
            (identical(other.allSeat, allSeat) || other.allSeat == allSeat) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allSeat, seat, reservation);

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeatViewModelImplCopyWith<_$SeatViewModelImpl> get copyWith =>
      __$$SeatViewModelImplCopyWithImpl<_$SeatViewModelImpl>(this, _$identity);
}

abstract class _SeatViewModel implements SeatViewModel {
  const factory _SeatViewModel(
      {final GetAllSeatEntity? allSeat,
      final SeatItemEntity? seat,
      final CreateReservationEntity? reservation}) = _$SeatViewModelImpl;

  @override
  GetAllSeatEntity? get allSeat;
  @override
  SeatItemEntity? get seat;
  @override
  CreateReservationEntity? get reservation;

  /// Create a copy of SeatViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeatViewModelImplCopyWith<_$SeatViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
