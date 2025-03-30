// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttachmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddAttachmentRequest request) addAttachment,
    required TResult Function(GetAttachmentRequest request) getAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddAttachmentRequest request)? addAttachment,
    TResult? Function(GetAttachmentRequest request)? getAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddAttachmentRequest request)? addAttachment,
    TResult Function(GetAttachmentRequest request)? getAttachment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddAttachment value) addAttachment,
    required TResult Function(_GetAttachment value) getAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddAttachment value)? addAttachment,
    TResult? Function(_GetAttachment value)? getAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddAttachment value)? addAttachment,
    TResult Function(_GetAttachment value)? getAttachment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentEventCopyWith<$Res> {
  factory $AttachmentEventCopyWith(
          AttachmentEvent value, $Res Function(AttachmentEvent) then) =
      _$AttachmentEventCopyWithImpl<$Res, AttachmentEvent>;
}

/// @nodoc
class _$AttachmentEventCopyWithImpl<$Res, $Val extends AttachmentEvent>
    implements $AttachmentEventCopyWith<$Res> {
  _$AttachmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttachmentEvent
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
    extends _$AttachmentEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AttachmentEvent.started()';
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
    required TResult Function(AddAttachmentRequest request) addAttachment,
    required TResult Function(GetAttachmentRequest request) getAttachment,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddAttachmentRequest request)? addAttachment,
    TResult? Function(GetAttachmentRequest request)? getAttachment,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddAttachmentRequest request)? addAttachment,
    TResult Function(GetAttachmentRequest request)? getAttachment,
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
    required TResult Function(_AddAttachment value) addAttachment,
    required TResult Function(_GetAttachment value) getAttachment,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddAttachment value)? addAttachment,
    TResult? Function(_GetAttachment value)? getAttachment,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddAttachment value)? addAttachment,
    TResult Function(_GetAttachment value)? getAttachment,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AttachmentEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddAttachmentImplCopyWith<$Res> {
  factory _$$AddAttachmentImplCopyWith(
          _$AddAttachmentImpl value, $Res Function(_$AddAttachmentImpl) then) =
      __$$AddAttachmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddAttachmentRequest request});

  $AddAttachmentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$AddAttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentEventCopyWithImpl<$Res, _$AddAttachmentImpl>
    implements _$$AddAttachmentImplCopyWith<$Res> {
  __$$AddAttachmentImplCopyWithImpl(
      _$AddAttachmentImpl _value, $Res Function(_$AddAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$AddAttachmentImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as AddAttachmentRequest,
    ));
  }

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddAttachmentRequestCopyWith<$Res> get request {
    return $AddAttachmentRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$AddAttachmentImpl implements _AddAttachment {
  const _$AddAttachmentImpl(this.request);

  @override
  final AddAttachmentRequest request;

  @override
  String toString() {
    return 'AttachmentEvent.addAttachment(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAttachmentImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAttachmentImplCopyWith<_$AddAttachmentImpl> get copyWith =>
      __$$AddAttachmentImplCopyWithImpl<_$AddAttachmentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddAttachmentRequest request) addAttachment,
    required TResult Function(GetAttachmentRequest request) getAttachment,
  }) {
    return addAttachment(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddAttachmentRequest request)? addAttachment,
    TResult? Function(GetAttachmentRequest request)? getAttachment,
  }) {
    return addAttachment?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddAttachmentRequest request)? addAttachment,
    TResult Function(GetAttachmentRequest request)? getAttachment,
    required TResult orElse(),
  }) {
    if (addAttachment != null) {
      return addAttachment(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddAttachment value) addAttachment,
    required TResult Function(_GetAttachment value) getAttachment,
  }) {
    return addAttachment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddAttachment value)? addAttachment,
    TResult? Function(_GetAttachment value)? getAttachment,
  }) {
    return addAttachment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddAttachment value)? addAttachment,
    TResult Function(_GetAttachment value)? getAttachment,
    required TResult orElse(),
  }) {
    if (addAttachment != null) {
      return addAttachment(this);
    }
    return orElse();
  }
}

abstract class _AddAttachment implements AttachmentEvent {
  const factory _AddAttachment(final AddAttachmentRequest request) =
      _$AddAttachmentImpl;

  AddAttachmentRequest get request;

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAttachmentImplCopyWith<_$AddAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAttachmentImplCopyWith<$Res> {
  factory _$$GetAttachmentImplCopyWith(
          _$GetAttachmentImpl value, $Res Function(_$GetAttachmentImpl) then) =
      __$$GetAttachmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetAttachmentRequest request});

  $GetAttachmentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$GetAttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentEventCopyWithImpl<$Res, _$GetAttachmentImpl>
    implements _$$GetAttachmentImplCopyWith<$Res> {
  __$$GetAttachmentImplCopyWithImpl(
      _$GetAttachmentImpl _value, $Res Function(_$GetAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$GetAttachmentImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GetAttachmentRequest,
    ));
  }

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetAttachmentRequestCopyWith<$Res> get request {
    return $GetAttachmentRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$GetAttachmentImpl implements _GetAttachment {
  const _$GetAttachmentImpl(this.request);

  @override
  final GetAttachmentRequest request;

  @override
  String toString() {
    return 'AttachmentEvent.getAttachment(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAttachmentImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAttachmentImplCopyWith<_$GetAttachmentImpl> get copyWith =>
      __$$GetAttachmentImplCopyWithImpl<_$GetAttachmentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddAttachmentRequest request) addAttachment,
    required TResult Function(GetAttachmentRequest request) getAttachment,
  }) {
    return getAttachment(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddAttachmentRequest request)? addAttachment,
    TResult? Function(GetAttachmentRequest request)? getAttachment,
  }) {
    return getAttachment?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddAttachmentRequest request)? addAttachment,
    TResult Function(GetAttachmentRequest request)? getAttachment,
    required TResult orElse(),
  }) {
    if (getAttachment != null) {
      return getAttachment(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddAttachment value) addAttachment,
    required TResult Function(_GetAttachment value) getAttachment,
  }) {
    return getAttachment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddAttachment value)? addAttachment,
    TResult? Function(_GetAttachment value)? getAttachment,
  }) {
    return getAttachment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddAttachment value)? addAttachment,
    TResult Function(_GetAttachment value)? getAttachment,
    required TResult orElse(),
  }) {
    if (getAttachment != null) {
      return getAttachment(this);
    }
    return orElse();
  }
}

abstract class _GetAttachment implements AttachmentEvent {
  const factory _GetAttachment(final GetAttachmentRequest request) =
      _$GetAttachmentImpl;

  GetAttachmentRequest get request;

  /// Create a copy of AttachmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAttachmentImplCopyWith<_$GetAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttachmentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AttachmentViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AttachmentViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AttachmentViewModel viewModel)? loaded,
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
abstract class $AttachmentStateCopyWith<$Res> {
  factory $AttachmentStateCopyWith(
          AttachmentState value, $Res Function(AttachmentState) then) =
      _$AttachmentStateCopyWithImpl<$Res, AttachmentState>;
}

/// @nodoc
class _$AttachmentStateCopyWithImpl<$Res, $Val extends AttachmentState>
    implements $AttachmentStateCopyWith<$Res> {
  _$AttachmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttachmentState
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
    extends _$AttachmentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AttachmentState.loading()';
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
    required TResult Function(AttachmentViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AttachmentViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AttachmentViewModel viewModel)? loaded,
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

abstract class _Loading implements AttachmentState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AttachmentViewModel viewModel});

  $AttachmentViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AttachmentStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentState
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
              as AttachmentViewModel,
    ));
  }

  /// Create a copy of AttachmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttachmentViewModelCopyWith<$Res> get viewModel {
    return $AttachmentViewModelCopyWith<$Res>(_value.viewModel, (value) {
      return _then(_value.copyWith(viewModel: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.viewModel});

  @override
  final AttachmentViewModel viewModel;

  @override
  String toString() {
    return 'AttachmentState.loaded(viewModel: $viewModel)';
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

  /// Create a copy of AttachmentState
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
    required TResult Function(AttachmentViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AttachmentViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AttachmentViewModel viewModel)? loaded,
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

abstract class _Loaded implements AttachmentState {
  const factory _Loaded({required final AttachmentViewModel viewModel}) =
      _$LoadedImpl;

  AttachmentViewModel get viewModel;

  /// Create a copy of AttachmentState
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
    extends _$AttachmentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentState
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
    return 'AttachmentState.error(error: $error)';
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

  /// Create a copy of AttachmentState
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
    required TResult Function(AttachmentViewModel viewModel) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AttachmentViewModel viewModel)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AttachmentViewModel viewModel)? loaded,
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

abstract class _Error implements AttachmentState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of AttachmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttachmentViewModel {
  AttachmentEntity? get attachment => throw _privateConstructorUsedError;

  /// Create a copy of AttachmentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentViewModelCopyWith<AttachmentViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentViewModelCopyWith<$Res> {
  factory $AttachmentViewModelCopyWith(
          AttachmentViewModel value, $Res Function(AttachmentViewModel) then) =
      _$AttachmentViewModelCopyWithImpl<$Res, AttachmentViewModel>;
  @useResult
  $Res call({AttachmentEntity? attachment});

  $AttachmentEntityCopyWith<$Res>? get attachment;
}

/// @nodoc
class _$AttachmentViewModelCopyWithImpl<$Res, $Val extends AttachmentViewModel>
    implements $AttachmentViewModelCopyWith<$Res> {
  _$AttachmentViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttachmentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachment = freezed,
  }) {
    return _then(_value.copyWith(
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as AttachmentEntity?,
    ) as $Val);
  }

  /// Create a copy of AttachmentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttachmentEntityCopyWith<$Res>? get attachment {
    if (_value.attachment == null) {
      return null;
    }

    return $AttachmentEntityCopyWith<$Res>(_value.attachment!, (value) {
      return _then(_value.copyWith(attachment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttachmentViewModelImplCopyWith<$Res>
    implements $AttachmentViewModelCopyWith<$Res> {
  factory _$$AttachmentViewModelImplCopyWith(_$AttachmentViewModelImpl value,
          $Res Function(_$AttachmentViewModelImpl) then) =
      __$$AttachmentViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AttachmentEntity? attachment});

  @override
  $AttachmentEntityCopyWith<$Res>? get attachment;
}

/// @nodoc
class __$$AttachmentViewModelImplCopyWithImpl<$Res>
    extends _$AttachmentViewModelCopyWithImpl<$Res, _$AttachmentViewModelImpl>
    implements _$$AttachmentViewModelImplCopyWith<$Res> {
  __$$AttachmentViewModelImplCopyWithImpl(_$AttachmentViewModelImpl _value,
      $Res Function(_$AttachmentViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachment = freezed,
  }) {
    return _then(_$AttachmentViewModelImpl(
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as AttachmentEntity?,
    ));
  }
}

/// @nodoc

class _$AttachmentViewModelImpl implements _AttachmentViewModel {
  const _$AttachmentViewModelImpl({this.attachment});

  @override
  final AttachmentEntity? attachment;

  @override
  String toString() {
    return 'AttachmentViewModel(attachment: $attachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentViewModelImpl &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attachment);

  /// Create a copy of AttachmentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentViewModelImplCopyWith<_$AttachmentViewModelImpl> get copyWith =>
      __$$AttachmentViewModelImplCopyWithImpl<_$AttachmentViewModelImpl>(
          this, _$identity);
}

abstract class _AttachmentViewModel implements AttachmentViewModel {
  const factory _AttachmentViewModel({final AttachmentEntity? attachment}) =
      _$AttachmentViewModelImpl;

  @override
  AttachmentEntity? get attachment;

  /// Create a copy of AttachmentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentViewModelImplCopyWith<_$AttachmentViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
