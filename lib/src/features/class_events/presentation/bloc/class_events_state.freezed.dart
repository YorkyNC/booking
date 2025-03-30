// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_events_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClassEventsState {
  List<ClassEntity>? get classes => throw _privateConstructorUsedError;
  List<ClassEntity>? get filteredClasses => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  int get sortColumnIndex => throw _privateConstructorUsedError;
  bool get sortAscending => throw _privateConstructorUsedError;
  List<StudentEntity>? get students => throw _privateConstructorUsedError;

  /// Create a copy of ClassEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassEventsStateCopyWith<ClassEventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassEventsStateCopyWith<$Res> {
  factory $ClassEventsStateCopyWith(
          ClassEventsState value, $Res Function(ClassEventsState) then) =
      _$ClassEventsStateCopyWithImpl<$Res, ClassEventsState>;
  @useResult
  $Res call(
      {List<ClassEntity>? classes,
      List<ClassEntity>? filteredClasses,
      bool isSearching,
      String searchQuery,
      int sortColumnIndex,
      bool sortAscending,
      List<StudentEntity>? students});
}

/// @nodoc
class _$ClassEventsStateCopyWithImpl<$Res, $Val extends ClassEventsState>
    implements $ClassEventsStateCopyWith<$Res> {
  _$ClassEventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classes = freezed,
    Object? filteredClasses = freezed,
    Object? isSearching = null,
    Object? searchQuery = null,
    Object? sortColumnIndex = null,
    Object? sortAscending = null,
    Object? students = freezed,
  }) {
    return _then(_value.copyWith(
      classes: freezed == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
      filteredClasses: freezed == filteredClasses
          ? _value.filteredClasses
          : filteredClasses // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      sortColumnIndex: null == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sortAscending: null == sortAscending
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassEventsStateImplCopyWith<$Res>
    implements $ClassEventsStateCopyWith<$Res> {
  factory _$$ClassEventsStateImplCopyWith(_$ClassEventsStateImpl value,
          $Res Function(_$ClassEventsStateImpl) then) =
      __$$ClassEventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ClassEntity>? classes,
      List<ClassEntity>? filteredClasses,
      bool isSearching,
      String searchQuery,
      int sortColumnIndex,
      bool sortAscending,
      List<StudentEntity>? students});
}

/// @nodoc
class __$$ClassEventsStateImplCopyWithImpl<$Res>
    extends _$ClassEventsStateCopyWithImpl<$Res, _$ClassEventsStateImpl>
    implements _$$ClassEventsStateImplCopyWith<$Res> {
  __$$ClassEventsStateImplCopyWithImpl(_$ClassEventsStateImpl _value,
      $Res Function(_$ClassEventsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassEventsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classes = freezed,
    Object? filteredClasses = freezed,
    Object? isSearching = null,
    Object? searchQuery = null,
    Object? sortColumnIndex = null,
    Object? sortAscending = null,
    Object? students = freezed,
  }) {
    return _then(_$ClassEventsStateImpl(
      classes: freezed == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
      filteredClasses: freezed == filteredClasses
          ? _value._filteredClasses
          : filteredClasses // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      sortColumnIndex: null == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sortAscending: null == sortAscending
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentEntity>?,
    ));
  }
}

/// @nodoc

class _$ClassEventsStateImpl implements _ClassEventsState {
  _$ClassEventsStateImpl(
      {final List<ClassEntity>? classes,
      final List<ClassEntity>? filteredClasses,
      this.isSearching = false,
      this.searchQuery = '',
      this.sortColumnIndex = -1,
      this.sortAscending = true,
      final List<StudentEntity>? students})
      : _classes = classes,
        _filteredClasses = filteredClasses,
        _students = students;

  final List<ClassEntity>? _classes;
  @override
  List<ClassEntity>? get classes {
    final value = _classes;
    if (value == null) return null;
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ClassEntity>? _filteredClasses;
  @override
  List<ClassEntity>? get filteredClasses {
    final value = _filteredClasses;
    if (value == null) return null;
    if (_filteredClasses is EqualUnmodifiableListView) return _filteredClasses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int sortColumnIndex;
  @override
  @JsonKey()
  final bool sortAscending;
  final List<StudentEntity>? _students;
  @override
  List<StudentEntity>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassEventsState(classes: $classes, filteredClasses: $filteredClasses, isSearching: $isSearching, searchQuery: $searchQuery, sortColumnIndex: $sortColumnIndex, sortAscending: $sortAscending, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassEventsStateImpl &&
            const DeepCollectionEquality().equals(other._classes, _classes) &&
            const DeepCollectionEquality()
                .equals(other._filteredClasses, _filteredClasses) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.sortColumnIndex, sortColumnIndex) ||
                other.sortColumnIndex == sortColumnIndex) &&
            (identical(other.sortAscending, sortAscending) ||
                other.sortAscending == sortAscending) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_classes),
      const DeepCollectionEquality().hash(_filteredClasses),
      isSearching,
      searchQuery,
      sortColumnIndex,
      sortAscending,
      const DeepCollectionEquality().hash(_students));

  /// Create a copy of ClassEventsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassEventsStateImplCopyWith<_$ClassEventsStateImpl> get copyWith =>
      __$$ClassEventsStateImplCopyWithImpl<_$ClassEventsStateImpl>(
          this, _$identity);
}

abstract class _ClassEventsState implements ClassEventsState {
  factory _ClassEventsState(
      {final List<ClassEntity>? classes,
      final List<ClassEntity>? filteredClasses,
      final bool isSearching,
      final String searchQuery,
      final int sortColumnIndex,
      final bool sortAscending,
      final List<StudentEntity>? students}) = _$ClassEventsStateImpl;

  @override
  List<ClassEntity>? get classes;
  @override
  List<ClassEntity>? get filteredClasses;
  @override
  bool get isSearching;
  @override
  String get searchQuery;
  @override
  int get sortColumnIndex;
  @override
  bool get sortAscending;
  @override
  List<StudentEntity>? get students;

  /// Create a copy of ClassEventsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassEventsStateImplCopyWith<_$ClassEventsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
