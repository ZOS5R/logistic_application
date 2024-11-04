// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManagerState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  Locale get languageCode => throw _privateConstructorUsedError;

  /// Create a copy of ManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManagerStateCopyWith<ManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerStateCopyWith<$Res> {
  factory $ManagerStateCopyWith(
          ManagerState value, $Res Function(ManagerState) then) =
      _$ManagerStateCopyWithImpl<$Res, ManagerState>;
  @useResult
  $Res call({ThemeMode themeMode, Locale languageCode});
}

/// @nodoc
class _$ManagerStateCopyWithImpl<$Res, $Val extends ManagerState>
    implements $ManagerStateCopyWith<$Res> {
  _$ManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? languageCode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManagerStateImplCopyWith<$Res>
    implements $ManagerStateCopyWith<$Res> {
  factory _$$ManagerStateImplCopyWith(
          _$ManagerStateImpl value, $Res Function(_$ManagerStateImpl) then) =
      __$$ManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode, Locale languageCode});
}

/// @nodoc
class __$$ManagerStateImplCopyWithImpl<$Res>
    extends _$ManagerStateCopyWithImpl<$Res, _$ManagerStateImpl>
    implements _$$ManagerStateImplCopyWith<$Res> {
  __$$ManagerStateImplCopyWithImpl(
      _$ManagerStateImpl _value, $Res Function(_$ManagerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? languageCode = null,
  }) {
    return _then(_$ManagerStateImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$ManagerStateImpl implements _ManagerState {
  const _$ManagerStateImpl(
      {required this.themeMode, required this.languageCode});

  @override
  final ThemeMode themeMode;
  @override
  final Locale languageCode;

  @override
  String toString() {
    return 'ManagerState(themeMode: $themeMode, languageCode: $languageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagerStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode, languageCode);

  /// Create a copy of ManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagerStateImplCopyWith<_$ManagerStateImpl> get copyWith =>
      __$$ManagerStateImplCopyWithImpl<_$ManagerStateImpl>(this, _$identity);
}

abstract class _ManagerState implements ManagerState {
  const factory _ManagerState(
      {required final ThemeMode themeMode,
      required final Locale languageCode}) = _$ManagerStateImpl;

  @override
  ThemeMode get themeMode;
  @override
  Locale get languageCode;

  /// Create a copy of ManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManagerStateImplCopyWith<_$ManagerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
