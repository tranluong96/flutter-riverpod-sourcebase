// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FCMState {

 bool get permissionGranted; String? get deviceToken; Map<String, dynamic>? get lastMessage; bool get openedFromNotification;
/// Create a copy of FCMState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FCMStateCopyWith<FCMState> get copyWith => _$FCMStateCopyWithImpl<FCMState>(this as FCMState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FCMState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FCMState&&(identical(other.permissionGranted, _this.permissionGranted) || other.permissionGranted == _this.permissionGranted)&&(identical(other.deviceToken, _this.deviceToken) || other.deviceToken == _this.deviceToken)&&const DeepCollectionEquality().equals(other.lastMessage, _this.lastMessage)&&(identical(other.openedFromNotification, _this.openedFromNotification) || other.openedFromNotification == _this.openedFromNotification));
}


@override
int get hashCode {
  final _this = this as FCMState;
  return Object.hash(runtimeType,_this.permissionGranted,_this.deviceToken,const DeepCollectionEquality().hash(_this.lastMessage),_this.openedFromNotification);
}

@override
String toString() {
  final _this = this as FCMState;
  return 'FCMState(permissionGranted: ${_this.permissionGranted}, deviceToken: ${_this.deviceToken}, lastMessage: ${_this.lastMessage}, openedFromNotification: ${_this.openedFromNotification})';
}


}

/// @nodoc
abstract mixin class $FCMStateCopyWith<$Res>  {
  factory $FCMStateCopyWith(FCMState value, $Res Function(FCMState) _then) = _$FCMStateCopyWithImpl;
@useResult
$Res call({
 bool permissionGranted, String? deviceToken, Map<String, dynamic>? lastMessage, bool openedFromNotification
});




}
/// @nodoc
class _$FCMStateCopyWithImpl<$Res>
    implements $FCMStateCopyWith<$Res> {
  _$FCMStateCopyWithImpl(this._self, this._then);

  final FCMState _self;
  final $Res Function(FCMState) _then;

/// Create a copy of FCMState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permissionGranted = null,Object? deviceToken = freezed,Object? lastMessage = freezed,Object? openedFromNotification = null,}) {
  return _then(FCMState(
permissionGranted: null == permissionGranted ? _self.permissionGranted : permissionGranted // ignore: cast_nullable_to_non_nullable
as bool,deviceToken: freezed == deviceToken ? _self.deviceToken : deviceToken // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,openedFromNotification: null == openedFromNotification ? _self.openedFromNotification : openedFromNotification // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FCMState].
extension FCMStatePatterns on FCMState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FCMState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FCMState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FCMState value)  $default,){
final _that = this;
switch (_that) {
case _FCMState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FCMState value)?  $default,){
final _that = this;
switch (_that) {
case _FCMState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool permissionGranted,  String? deviceToken,  Map<String, dynamic>? lastMessage,  bool openedFromNotification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FCMState() when $default != null:
return $default(_that.permissionGranted,_that.deviceToken,_that.lastMessage,_that.openedFromNotification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool permissionGranted,  String? deviceToken,  Map<String, dynamic>? lastMessage,  bool openedFromNotification)  $default,) {final _that = this;
switch (_that) {
case _FCMState():
return $default(_that.permissionGranted,_that.deviceToken,_that.lastMessage,_that.openedFromNotification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool permissionGranted,  String? deviceToken,  Map<String, dynamic>? lastMessage,  bool openedFromNotification)?  $default,) {final _that = this;
switch (_that) {
case _FCMState() when $default != null:
return $default(_that.permissionGranted,_that.deviceToken,_that.lastMessage,_that.openedFromNotification);case _:
  return null;

}
}

}

/// @nodoc


class _FCMState implements FCMState {
  const _FCMState({this.permissionGranted = false, this.deviceToken,  Map<String, dynamic>? lastMessage, this.openedFromNotification = false}): _lastMessage = lastMessage;
  

@override@JsonKey() final  bool permissionGranted;
@override final  String? deviceToken;
 final  Map<String, dynamic>? _lastMessage;
@override Map<String, dynamic>? get lastMessage {
  final value = _lastMessage;
  if (value == null) return null;
  if (_lastMessage is EqualUnmodifiableMapView) return _lastMessage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  bool openedFromNotification;

/// Create a copy of FCMState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FCMStateCopyWith<_FCMState> get copyWith => __$FCMStateCopyWithImpl<_FCMState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FCMState&&(identical(other.permissionGranted, permissionGranted) || other.permissionGranted == permissionGranted)&&(identical(other.deviceToken, deviceToken) || other.deviceToken == deviceToken)&&const DeepCollectionEquality().equals(other.lastMessage, _lastMessage)&&(identical(other.openedFromNotification, openedFromNotification) || other.openedFromNotification == openedFromNotification));
}


@override
int get hashCode {
    return Object.hash(runtimeType,permissionGranted,deviceToken,const DeepCollectionEquality().hash(_lastMessage),openedFromNotification);
}

@override
String toString() {
    return 'FCMState(permissionGranted: $permissionGranted, deviceToken: $deviceToken, lastMessage: $lastMessage, openedFromNotification: $openedFromNotification)';
}


}

/// @nodoc
abstract mixin class _$FCMStateCopyWith<$Res> implements $FCMStateCopyWith<$Res> {
  factory _$FCMStateCopyWith(_FCMState value, $Res Function(_FCMState) _then) = __$FCMStateCopyWithImpl;
@override @useResult
$Res call({
 bool permissionGranted, String? deviceToken, Map<String, dynamic>? lastMessage, bool openedFromNotification
});




}
/// @nodoc
class __$FCMStateCopyWithImpl<$Res>
    implements _$FCMStateCopyWith<$Res> {
  __$FCMStateCopyWithImpl(this._self, this._then);

  final _FCMState _self;
  final $Res Function(_FCMState) _then;

/// Create a copy of FCMState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permissionGranted = null,Object? deviceToken = freezed,Object? lastMessage = freezed,Object? openedFromNotification = null,}) {
  return _then(_FCMState(
permissionGranted: null == permissionGranted ? _self.permissionGranted : permissionGranted // ignore: cast_nullable_to_non_nullable
as bool,deviceToken: freezed == deviceToken ? _self.deviceToken : deviceToken // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self._lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,openedFromNotification: null == openedFromNotification ? _self.openedFromNotification : openedFromNotification // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
