// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_shell_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppShellState {

 AppVersionModel? get versionInfo; bool get hasNewVersion; bool get doNotShowAgain;
/// Create a copy of AppShellState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppShellStateCopyWith<AppShellState> get copyWith => _$AppShellStateCopyWithImpl<AppShellState>(this as AppShellState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppShellState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppShellState&&(identical(other.versionInfo, _this.versionInfo) || other.versionInfo == _this.versionInfo)&&(identical(other.hasNewVersion, _this.hasNewVersion) || other.hasNewVersion == _this.hasNewVersion)&&(identical(other.doNotShowAgain, _this.doNotShowAgain) || other.doNotShowAgain == _this.doNotShowAgain));
}


@override
int get hashCode {
  final _this = this as AppShellState;
  return Object.hash(runtimeType,_this.versionInfo,_this.hasNewVersion,_this.doNotShowAgain);
}

@override
String toString() {
  final _this = this as AppShellState;
  return 'AppShellState(versionInfo: ${_this.versionInfo}, hasNewVersion: ${_this.hasNewVersion}, doNotShowAgain: ${_this.doNotShowAgain})';
}


}

/// @nodoc
abstract mixin class $AppShellStateCopyWith<$Res>  {
  factory $AppShellStateCopyWith(AppShellState value, $Res Function(AppShellState) _then) = _$AppShellStateCopyWithImpl;
@useResult
$Res call({
 AppVersionModel? versionInfo, bool hasNewVersion, bool doNotShowAgain
});




}
/// @nodoc
class _$AppShellStateCopyWithImpl<$Res>
    implements $AppShellStateCopyWith<$Res> {
  _$AppShellStateCopyWithImpl(this._self, this._then);

  final AppShellState _self;
  final $Res Function(AppShellState) _then;

/// Create a copy of AppShellState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? versionInfo = freezed,Object? hasNewVersion = null,Object? doNotShowAgain = null,}) {
  return _then(AppShellState(
versionInfo: freezed == versionInfo ? _self.versionInfo : versionInfo // ignore: cast_nullable_to_non_nullable
as AppVersionModel?,hasNewVersion: null == hasNewVersion ? _self.hasNewVersion : hasNewVersion // ignore: cast_nullable_to_non_nullable
as bool,doNotShowAgain: null == doNotShowAgain ? _self.doNotShowAgain : doNotShowAgain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppShellState].
extension AppShellStatePatterns on AppShellState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppShellState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppShellState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppShellState value)  $default,){
final _that = this;
switch (_that) {
case _AppShellState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppShellState value)?  $default,){
final _that = this;
switch (_that) {
case _AppShellState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppVersionModel? versionInfo,  bool hasNewVersion,  bool doNotShowAgain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppShellState() when $default != null:
return $default(_that.versionInfo,_that.hasNewVersion,_that.doNotShowAgain);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppVersionModel? versionInfo,  bool hasNewVersion,  bool doNotShowAgain)  $default,) {final _that = this;
switch (_that) {
case _AppShellState():
return $default(_that.versionInfo,_that.hasNewVersion,_that.doNotShowAgain);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppVersionModel? versionInfo,  bool hasNewVersion,  bool doNotShowAgain)?  $default,) {final _that = this;
switch (_that) {
case _AppShellState() when $default != null:
return $default(_that.versionInfo,_that.hasNewVersion,_that.doNotShowAgain);case _:
  return null;

}
}

}

/// @nodoc


class _AppShellState extends AppShellState {
  const _AppShellState({this.versionInfo, this.hasNewVersion = false, this.doNotShowAgain = false}): super._();
  

@override final  AppVersionModel? versionInfo;
@override@JsonKey() final  bool hasNewVersion;
@override@JsonKey() final  bool doNotShowAgain;

/// Create a copy of AppShellState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppShellStateCopyWith<_AppShellState> get copyWith => __$AppShellStateCopyWithImpl<_AppShellState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppShellState&&(identical(other.versionInfo, versionInfo) || other.versionInfo == versionInfo)&&(identical(other.hasNewVersion, hasNewVersion) || other.hasNewVersion == hasNewVersion)&&(identical(other.doNotShowAgain, doNotShowAgain) || other.doNotShowAgain == doNotShowAgain));
}


@override
int get hashCode {
    return Object.hash(runtimeType,versionInfo,hasNewVersion,doNotShowAgain);
}

@override
String toString() {
    return 'AppShellState(versionInfo: $versionInfo, hasNewVersion: $hasNewVersion, doNotShowAgain: $doNotShowAgain)';
}


}

/// @nodoc
abstract mixin class _$AppShellStateCopyWith<$Res> implements $AppShellStateCopyWith<$Res> {
  factory _$AppShellStateCopyWith(_AppShellState value, $Res Function(_AppShellState) _then) = __$AppShellStateCopyWithImpl;
@override @useResult
$Res call({
 AppVersionModel? versionInfo, bool hasNewVersion, bool doNotShowAgain
});




}
/// @nodoc
class __$AppShellStateCopyWithImpl<$Res>
    implements _$AppShellStateCopyWith<$Res> {
  __$AppShellStateCopyWithImpl(this._self, this._then);

  final _AppShellState _self;
  final $Res Function(_AppShellState) _then;

/// Create a copy of AppShellState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? versionInfo = freezed,Object? hasNewVersion = null,Object? doNotShowAgain = null,}) {
  return _then(_AppShellState(
versionInfo: freezed == versionInfo ? _self.versionInfo : versionInfo // ignore: cast_nullable_to_non_nullable
as AppVersionModel?,hasNewVersion: null == hasNewVersion ? _self.hasNewVersion : hasNewVersion // ignore: cast_nullable_to_non_nullable
as bool,doNotShowAgain: null == doNotShowAgain ? _self.doNotShowAgain : doNotShowAgain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
