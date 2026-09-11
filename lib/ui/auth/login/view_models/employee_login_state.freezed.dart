// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeLoginState {

 StatusState get status; String get employeeId; String get password; String? get errorValidation;
/// Create a copy of EmployeeLoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeLoginStateCopyWith<EmployeeLoginState> get copyWith => _$EmployeeLoginStateCopyWithImpl<EmployeeLoginState>(this as EmployeeLoginState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EmployeeLoginState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeLoginState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.errorValidation, _this.errorValidation) || other.errorValidation == _this.errorValidation));
}


@override
int get hashCode {
  final _this = this as EmployeeLoginState;
  return Object.hash(runtimeType,_this.status,_this.employeeId,_this.password,_this.errorValidation);
}

@override
String toString() {
  final _this = this as EmployeeLoginState;
  return 'EmployeeLoginState(status: ${_this.status}, employeeId: ${_this.employeeId}, password: ${_this.password}, errorValidation: ${_this.errorValidation})';
}


}

/// @nodoc
abstract mixin class $EmployeeLoginStateCopyWith<$Res>  {
  factory $EmployeeLoginStateCopyWith(EmployeeLoginState value, $Res Function(EmployeeLoginState) _then) = _$EmployeeLoginStateCopyWithImpl;
@useResult
$Res call({
 StatusState status, String employeeId, String password, String? errorValidation
});




}
/// @nodoc
class _$EmployeeLoginStateCopyWithImpl<$Res>
    implements $EmployeeLoginStateCopyWith<$Res> {
  _$EmployeeLoginStateCopyWithImpl(this._self, this._then);

  final EmployeeLoginState _self;
  final $Res Function(EmployeeLoginState) _then;

/// Create a copy of EmployeeLoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? employeeId = null,Object? password = null,Object? errorValidation = freezed,}) {
  return _then(EmployeeLoginState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusState,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,errorValidation: freezed == errorValidation ? _self.errorValidation : errorValidation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeLoginState].
extension EmployeeLoginStatePatterns on EmployeeLoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeLoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeLoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeLoginState value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeLoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeLoginState value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeLoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusState status,  String employeeId,  String password,  String? errorValidation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeLoginState() when $default != null:
return $default(_that.status,_that.employeeId,_that.password,_that.errorValidation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusState status,  String employeeId,  String password,  String? errorValidation)  $default,) {final _that = this;
switch (_that) {
case _EmployeeLoginState():
return $default(_that.status,_that.employeeId,_that.password,_that.errorValidation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusState status,  String employeeId,  String password,  String? errorValidation)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeLoginState() when $default != null:
return $default(_that.status,_that.employeeId,_that.password,_that.errorValidation);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeeLoginState extends EmployeeLoginState {
  const _EmployeeLoginState({this.status = StatusState.idle, this.employeeId = "", this.password = "", this.errorValidation = null}): super._();
  

@override@JsonKey() final  StatusState status;
@override@JsonKey() final  String employeeId;
@override@JsonKey() final  String password;
@override@JsonKey() final  String? errorValidation;

/// Create a copy of EmployeeLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeLoginStateCopyWith<_EmployeeLoginState> get copyWith => __$EmployeeLoginStateCopyWithImpl<_EmployeeLoginState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeLoginState&&(identical(other.status, status) || other.status == status)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.password, password) || other.password == password)&&(identical(other.errorValidation, errorValidation) || other.errorValidation == errorValidation));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,employeeId,password,errorValidation);
}

@override
String toString() {
    return 'EmployeeLoginState(status: $status, employeeId: $employeeId, password: $password, errorValidation: $errorValidation)';
}


}

/// @nodoc
abstract mixin class _$EmployeeLoginStateCopyWith<$Res> implements $EmployeeLoginStateCopyWith<$Res> {
  factory _$EmployeeLoginStateCopyWith(_EmployeeLoginState value, $Res Function(_EmployeeLoginState) _then) = __$EmployeeLoginStateCopyWithImpl;
@override @useResult
$Res call({
 StatusState status, String employeeId, String password, String? errorValidation
});




}
/// @nodoc
class __$EmployeeLoginStateCopyWithImpl<$Res>
    implements _$EmployeeLoginStateCopyWith<$Res> {
  __$EmployeeLoginStateCopyWithImpl(this._self, this._then);

  final _EmployeeLoginState _self;
  final $Res Function(_EmployeeLoginState) _then;

/// Create a copy of EmployeeLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? employeeId = null,Object? password = null,Object? errorValidation = freezed,}) {
  return _then(_EmployeeLoginState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusState,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,errorValidation: freezed == errorValidation ? _self.errorValidation : errorValidation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
