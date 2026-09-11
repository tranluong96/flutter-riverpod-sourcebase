// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingState {

 bool get isLoading;
/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingStateCopyWith<SettingState> get copyWith => _$SettingStateCopyWithImpl<SettingState>(this as SettingState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SettingState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingState&&(identical(other.isLoading, _this.isLoading) || other.isLoading == _this.isLoading));
}


@override
int get hashCode {
  final _this = this as SettingState;
  return Object.hash(runtimeType,_this.isLoading);
}

@override
String toString() {
  final _this = this as SettingState;
  return 'SettingState(isLoading: ${_this.isLoading})';
}


}

/// @nodoc
abstract mixin class $SettingStateCopyWith<$Res>  {
  factory $SettingStateCopyWith(SettingState value, $Res Function(SettingState) _then) = _$SettingStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class _$SettingStateCopyWithImpl<$Res>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._self, this._then);

  final SettingState _self;
  final $Res Function(SettingState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,}) {
  return _then(SettingState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingState].
extension SettingStatePatterns on SettingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingState value)  $default,){
final _that = this;
switch (_that) {
case _SettingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingState() when $default != null:
return $default(_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _SettingState():
return $default(_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SettingState() when $default != null:
return $default(_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SettingState implements SettingState {
  const _SettingState({this.isLoading = false});
  

@override@JsonKey() final  bool isLoading;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingStateCopyWith<_SettingState> get copyWith => __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isLoading);
}

@override
String toString() {
    return 'SettingState(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SettingStateCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(_SettingState value, $Res Function(_SettingState) _then) = __$SettingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class __$SettingStateCopyWithImpl<$Res>
    implements _$SettingStateCopyWith<$Res> {
  __$SettingStateCopyWithImpl(this._self, this._then);

  final _SettingState _self;
  final $Res Function(_SettingState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,}) {
  return _then(_SettingState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
