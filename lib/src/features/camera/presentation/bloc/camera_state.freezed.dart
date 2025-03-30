// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraState {
  List<CameraSectionEntity>? get cameraSections =>
      throw _privateConstructorUsedError;
  List<CameraSectionEntity>? get filteredCameraSections =>
      throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  CameraFilter get filter => throw _privateConstructorUsedError;
  CameraSorting get sort => throw _privateConstructorUsedError;
  Map<String, bool> get selectedFilters => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraStateCopyWith<CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res, CameraState>;
  @useResult
  $Res call(
      {List<CameraSectionEntity>? cameraSections,
      List<CameraSectionEntity>? filteredCameraSections,
      int? count,
      CameraFilter filter,
      CameraSorting sort,
      Map<String, bool> selectedFilters,
      String searchQuery,
      bool isSearching});

  $CameraFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res, $Val extends CameraState>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraSections = freezed,
    Object? filteredCameraSections = freezed,
    Object? count = freezed,
    Object? filter = null,
    Object? sort = null,
    Object? selectedFilters = null,
    Object? searchQuery = null,
    Object? isSearching = null,
  }) {
    return _then(_value.copyWith(
      cameraSections: freezed == cameraSections
          ? _value.cameraSections
          : cameraSections // ignore: cast_nullable_to_non_nullable
              as List<CameraSectionEntity>?,
      filteredCameraSections: freezed == filteredCameraSections
          ? _value.filteredCameraSections
          : filteredCameraSections // ignore: cast_nullable_to_non_nullable
              as List<CameraSectionEntity>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as CameraFilter,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as CameraSorting,
      selectedFilters: null == selectedFilters
          ? _value.selectedFilters
          : selectedFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CameraFilterCopyWith<$Res> get filter {
    return $CameraFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CameraStateImplCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$$CameraStateImplCopyWith(
          _$CameraStateImpl value, $Res Function(_$CameraStateImpl) then) =
      __$$CameraStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CameraSectionEntity>? cameraSections,
      List<CameraSectionEntity>? filteredCameraSections,
      int? count,
      CameraFilter filter,
      CameraSorting sort,
      Map<String, bool> selectedFilters,
      String searchQuery,
      bool isSearching});

  @override
  $CameraFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$CameraStateImplCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$CameraStateImpl>
    implements _$$CameraStateImplCopyWith<$Res> {
  __$$CameraStateImplCopyWithImpl(
      _$CameraStateImpl _value, $Res Function(_$CameraStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraSections = freezed,
    Object? filteredCameraSections = freezed,
    Object? count = freezed,
    Object? filter = null,
    Object? sort = null,
    Object? selectedFilters = null,
    Object? searchQuery = null,
    Object? isSearching = null,
  }) {
    return _then(_$CameraStateImpl(
      cameraSections: freezed == cameraSections
          ? _value._cameraSections
          : cameraSections // ignore: cast_nullable_to_non_nullable
              as List<CameraSectionEntity>?,
      filteredCameraSections: freezed == filteredCameraSections
          ? _value._filteredCameraSections
          : filteredCameraSections // ignore: cast_nullable_to_non_nullable
              as List<CameraSectionEntity>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as CameraFilter,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as CameraSorting,
      selectedFilters: null == selectedFilters
          ? _value._selectedFilters
          : selectedFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CameraStateImpl implements _CameraState {
  _$CameraStateImpl(
      {final List<CameraSectionEntity>? cameraSections,
      final List<CameraSectionEntity>? filteredCameraSections,
      this.count,
      required this.filter,
      this.sort = CameraSorting.moreEvents,
      final Map<String, bool> selectedFilters = const {'all': true},
      this.searchQuery = '',
      this.isSearching = false})
      : _cameraSections = cameraSections,
        _filteredCameraSections = filteredCameraSections,
        _selectedFilters = selectedFilters;

  final List<CameraSectionEntity>? _cameraSections;
  @override
  List<CameraSectionEntity>? get cameraSections {
    final value = _cameraSections;
    if (value == null) return null;
    if (_cameraSections is EqualUnmodifiableListView) return _cameraSections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CameraSectionEntity>? _filteredCameraSections;
  @override
  List<CameraSectionEntity>? get filteredCameraSections {
    final value = _filteredCameraSections;
    if (value == null) return null;
    if (_filteredCameraSections is EqualUnmodifiableListView)
      return _filteredCameraSections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;
  @override
  final CameraFilter filter;
  @override
  @JsonKey()
  final CameraSorting sort;
  final Map<String, bool> _selectedFilters;
  @override
  @JsonKey()
  Map<String, bool> get selectedFilters {
    if (_selectedFilters is EqualUnmodifiableMapView) return _selectedFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedFilters);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'CameraState(cameraSections: $cameraSections, filteredCameraSections: $filteredCameraSections, count: $count, filter: $filter, sort: $sort, selectedFilters: $selectedFilters, searchQuery: $searchQuery, isSearching: $isSearching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraStateImpl &&
            const DeepCollectionEquality()
                .equals(other._cameraSections, _cameraSections) &&
            const DeepCollectionEquality().equals(
                other._filteredCameraSections, _filteredCameraSections) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            const DeepCollectionEquality()
                .equals(other._selectedFilters, _selectedFilters) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cameraSections),
      const DeepCollectionEquality().hash(_filteredCameraSections),
      count,
      filter,
      sort,
      const DeepCollectionEquality().hash(_selectedFilters),
      searchQuery,
      isSearching);

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      __$$CameraStateImplCopyWithImpl<_$CameraStateImpl>(this, _$identity);
}

abstract class _CameraState implements CameraState {
  factory _CameraState(
      {final List<CameraSectionEntity>? cameraSections,
      final List<CameraSectionEntity>? filteredCameraSections,
      final int? count,
      required final CameraFilter filter,
      final CameraSorting sort,
      final Map<String, bool> selectedFilters,
      final String searchQuery,
      final bool isSearching}) = _$CameraStateImpl;

  @override
  List<CameraSectionEntity>? get cameraSections;
  @override
  List<CameraSectionEntity>? get filteredCameraSections;
  @override
  int? get count;
  @override
  CameraFilter get filter;
  @override
  CameraSorting get sort;
  @override
  Map<String, bool> get selectedFilters;
  @override
  String get searchQuery;
  @override
  bool get isSearching;

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
