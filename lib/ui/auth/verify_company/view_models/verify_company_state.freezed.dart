// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_company_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyCompanyState {

 StatusState get status; String get companyCode; String? get errorInput; bool get navigateToEmployeeLogin; bool get navigateToHome;
/// Create a copy of VerifyCompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCompanyStateCopyWith<VerifyCompanyState> get copyWith => _$VerifyCompanyStateCopyWithImpl<VerifyCompanyState>(this as VerifyCompanyState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VerifyCompanyState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCompanyState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.companyCode, _this.companyCode) || other.companyCode == _this.companyCode)&&(identical(other.errorInput, _this.errorInput) || other.errorInput == _this.errorInput)&&(identical(other.navigateToEmployeeLogin, _this.navigateToEmployeeLogin) || other.navigateToEmployeeLogin == _this.navigateToEmployeeLogin)&&(identical(other.navigateToHome, _this.navigateToHome) || other.navigateToHome == _this.navigateToHome));
}


@override
int get hashCode {
  final _this = this as VerifyCompanyState;
  return Object.hash(runtimeType,_this.status,_this.companyCode,_this.errorInput,_this.navigateToEmployeeLogin,_this.navigateToHome);
}

@override
String toString() {
  final _this = this as VerifyCompanyState;
  return 'VerifyCompanyState(status: ${_this.status}, companyCode: ${_this.companyCode}, errorInput: ${_this.errorInput}, navigateToEmployeeLogin: ${_this.navigateToEmployeeLogin}, navigateToHome: ${_this.navigateToHome})';
}


}

/// @nodoc
abstract mixin class $VerifyCompanyStateCopyWith<$Res>  {
  factory $VerifyCompanyStateCopyWith(VerifyCompanyState value, $Res Function(VerifyCompanyState) _then) = _$VerifyCompanyStateCopyWithImpl;
@useResult
$Res call({
 StatusState status, String companyCode, String? errorInput, bool navigateToEmployeeLogin, bool navigateToHome
});




}
/// @nodoc
class _$VerifyCompanyStateCopyWithImpl<$Res>
    implements $VerifyCompanyStateCopyWith<$Res> {
  _$VerifyCompanyStateCopyWithImpl(this._self, this._then);

  final VerifyCompanyState _self;
  final $Res Function(VerifyCompanyState) _then;

/// Create a copy of VerifyCompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? companyCode = null,Object? errorInput = freezed,Object? navigateToEmployeeLogin = null,Object? navigateToHome = null,}) {
  return _then(VerifyCompanyState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusState,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,errorInput: freezed == errorInput ? _self.errorInput : errorInput // ignore: cast_nullable_to_non_nullable
as String?,navigateToEmployeeLogin: null == navigateToEmployeeLogin ? _self.navigateToEmployeeLogin : navigateToEmployeeLogin // ignore: cast_nullable_to_non_nullable
as bool,navigateToHome: null == navigateToHome ? _self.navigateToHome : navigateToHome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyCompanyState].
extension VerifyCompanyStatePatterns on VerifyCompanyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyCompanyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyCompanyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyCompanyState value)  $default,){
final _that = this;
switch (_that) {
case _VerifyCompanyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyCompanyState value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyCompanyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusState status,  String companyCode,  String? errorInput,  bool navigateToEmployeeLogin,  bool navigateToHome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyCompanyState() when $default != null:
return $default(_that.status,_that.companyCode,_that.errorInput,_that.navigateToEmployeeLogin,_that.navigateToHome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusState status,  String companyCode,  String? errorInput,  bool navigateToEmployeeLogin,  bool navigateToHome)  $default,) {final _that = this;
switch (_that) {
case _VerifyCompanyState():
return $default(_that.status,_that.companyCode,_that.errorInput,_that.navigateToEmployeeLogin,_that.navigateToHome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusState status,  String companyCode,  String? errorInput,  bool navigateToEmployeeLogin,  bool navigateToHome)?  $default,) {final _that = this;
switch (_that) {
case _VerifyCompanyState() when $default != null:
return $default(_that.status,_that.companyCode,_that.errorInput,_that.navigateToEmployeeLogin,_that.navigateToHome);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyCompanyState extends VerifyCompanyState {
  const _VerifyCompanyState({this.status = StatusState.idle, this.companyCode = "", this.errorInput = null, this.navigateToEmployeeLogin = false, this.navigateToHome = false}): super._();
  

@override@JsonKey() final  StatusState status;
@override@JsonKey() final  String companyCode;
@override@JsonKey() final  String? errorInput;
@override@JsonKey() final  bool navigateToEmployeeLogin;
@override@JsonKey() final  bool navigateToHome;

/// Create a copy of VerifyCompanyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyCompanyStateCopyWith<_VerifyCompanyState> get copyWith => __$VerifyCompanyStateCopyWithImpl<_VerifyCompanyState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyCompanyState&&(identical(other.status, status) || other.status == status)&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.errorInput, errorInput) || other.errorInput == errorInput)&&(identical(other.navigateToEmployeeLogin, navigateToEmployeeLogin) || other.navigateToEmployeeLogin == navigateToEmployeeLogin)&&(identical(other.navigateToHome, navigateToHome) || other.navigateToHome == navigateToHome));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,companyCode,errorInput,navigateToEmployeeLogin,navigateToHome);
}

@override
String toString() {
    return 'VerifyCompanyState(status: $status, companyCode: $companyCode, errorInput: $errorInput, navigateToEmployeeLogin: $navigateToEmployeeLogin, navigateToHome: $navigateToHome)';
}


}

/// @nodoc
abstract mixin class _$VerifyCompanyStateCopyWith<$Res> implements $VerifyCompanyStateCopyWith<$Res> {
  factory _$VerifyCompanyStateCopyWith(_VerifyCompanyState value, $Res Function(_VerifyCompanyState) _then) = __$VerifyCompanyStateCopyWithImpl;
@override @useResult
$Res call({
 StatusState status, String companyCode, String? errorInput, bool navigateToEmployeeLogin, bool navigateToHome
});




}
/// @nodoc
class __$VerifyCompanyStateCopyWithImpl<$Res>
    implements _$VerifyCompanyStateCopyWith<$Res> {
  __$VerifyCompanyStateCopyWithImpl(this._self, this._then);

  final _VerifyCompanyState _self;
  final $Res Function(_VerifyCompanyState) _then;

/// Create a copy of VerifyCompanyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? companyCode = null,Object? errorInput = freezed,Object? navigateToEmployeeLogin = null,Object? navigateToHome = null,}) {
  return _then(_VerifyCompanyState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusState,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,errorInput: freezed == errorInput ? _self.errorInput : errorInput // ignore: cast_nullable_to_non_nullable
as String?,navigateToEmployeeLogin: null == navigateToEmployeeLogin ? _self.navigateToEmployeeLogin : navigateToEmployeeLogin // ignore: cast_nullable_to_non_nullable
as bool,navigateToHome: null == navigateToHome ? _self.navigateToHome : navigateToHome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
