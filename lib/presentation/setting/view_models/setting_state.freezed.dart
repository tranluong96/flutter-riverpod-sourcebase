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

 bool get isLoading; String get apiErrorMessage; String get userCode; String get companyCode; Gender get gender; DateTime? get dateOfBirth; String get userName; String get email; String get employeeId; bool get isEdit;
/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingStateCopyWith<SettingState> get copyWith => _$SettingStateCopyWithImpl<SettingState>(this as SettingState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SettingState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingState&&(identical(other.isLoading, _this.isLoading) || other.isLoading == _this.isLoading)&&(identical(other.apiErrorMessage, _this.apiErrorMessage) || other.apiErrorMessage == _this.apiErrorMessage)&&(identical(other.userCode, _this.userCode) || other.userCode == _this.userCode)&&(identical(other.companyCode, _this.companyCode) || other.companyCode == _this.companyCode)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.userName, _this.userName) || other.userName == _this.userName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.isEdit, _this.isEdit) || other.isEdit == _this.isEdit));
}


@override
int get hashCode {
  final _this = this as SettingState;
  return Object.hash(runtimeType,_this.isLoading,_this.apiErrorMessage,_this.userCode,_this.companyCode,_this.gender,_this.dateOfBirth,_this.userName,_this.email,_this.employeeId,_this.isEdit);
}

@override
String toString() {
  final _this = this as SettingState;
  return 'SettingState(isLoading: ${_this.isLoading}, apiErrorMessage: ${_this.apiErrorMessage}, userCode: ${_this.userCode}, companyCode: ${_this.companyCode}, gender: ${_this.gender}, dateOfBirth: ${_this.dateOfBirth}, userName: ${_this.userName}, email: ${_this.email}, employeeId: ${_this.employeeId}, isEdit: ${_this.isEdit})';
}


}

/// @nodoc
abstract mixin class $SettingStateCopyWith<$Res>  {
  factory $SettingStateCopyWith(SettingState value, $Res Function(SettingState) _then) = _$SettingStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String apiErrorMessage, String userCode, String companyCode, Gender gender, DateTime? dateOfBirth, String userName, String email, String employeeId, bool isEdit
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
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? apiErrorMessage = null,Object? userCode = null,Object? companyCode = null,Object? gender = null,Object? dateOfBirth = freezed,Object? userName = null,Object? email = null,Object? employeeId = null,Object? isEdit = null,}) {
  return _then(SettingState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,apiErrorMessage: null == apiErrorMessage ? _self.apiErrorMessage : apiErrorMessage // ignore: cast_nullable_to_non_nullable
as String,userCode: null == userCode ? _self.userCode : userCode // ignore: cast_nullable_to_non_nullable
as String,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,isEdit: null == isEdit ? _self.isEdit : isEdit // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String apiErrorMessage,  String userCode,  String companyCode,  Gender gender,  DateTime? dateOfBirth,  String userName,  String email,  String employeeId,  bool isEdit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingState() when $default != null:
return $default(_that.isLoading,_that.apiErrorMessage,_that.userCode,_that.companyCode,_that.gender,_that.dateOfBirth,_that.userName,_that.email,_that.employeeId,_that.isEdit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String apiErrorMessage,  String userCode,  String companyCode,  Gender gender,  DateTime? dateOfBirth,  String userName,  String email,  String employeeId,  bool isEdit)  $default,) {final _that = this;
switch (_that) {
case _SettingState():
return $default(_that.isLoading,_that.apiErrorMessage,_that.userCode,_that.companyCode,_that.gender,_that.dateOfBirth,_that.userName,_that.email,_that.employeeId,_that.isEdit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String apiErrorMessage,  String userCode,  String companyCode,  Gender gender,  DateTime? dateOfBirth,  String userName,  String email,  String employeeId,  bool isEdit)?  $default,) {final _that = this;
switch (_that) {
case _SettingState() when $default != null:
return $default(_that.isLoading,_that.apiErrorMessage,_that.userCode,_that.companyCode,_that.gender,_that.dateOfBirth,_that.userName,_that.email,_that.employeeId,_that.isEdit);case _:
  return null;

}
}

}

/// @nodoc


class _SettingState implements SettingState {
  const _SettingState({this.isLoading = false, this.apiErrorMessage = '', this.userCode = '', this.companyCode = '', this.gender = Gender.other, this.dateOfBirth, this.userName = '', this.email = '', this.employeeId = '', this.isEdit = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String apiErrorMessage;
@override@JsonKey() final  String userCode;
@override@JsonKey() final  String companyCode;
@override@JsonKey() final  Gender gender;
@override final  DateTime? dateOfBirth;
@override@JsonKey() final  String userName;
@override@JsonKey() final  String email;
@override@JsonKey() final  String employeeId;
@override@JsonKey() final  bool isEdit;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingStateCopyWith<_SettingState> get copyWith => __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.apiErrorMessage, apiErrorMessage) || other.apiErrorMessage == apiErrorMessage)&&(identical(other.userCode, userCode) || other.userCode == userCode)&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.email, email) || other.email == email)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.isEdit, isEdit) || other.isEdit == isEdit));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isLoading,apiErrorMessage,userCode,companyCode,gender,dateOfBirth,userName,email,employeeId,isEdit);
}

@override
String toString() {
    return 'SettingState(isLoading: $isLoading, apiErrorMessage: $apiErrorMessage, userCode: $userCode, companyCode: $companyCode, gender: $gender, dateOfBirth: $dateOfBirth, userName: $userName, email: $email, employeeId: $employeeId, isEdit: $isEdit)';
}


}

/// @nodoc
abstract mixin class _$SettingStateCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(_SettingState value, $Res Function(_SettingState) _then) = __$SettingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String apiErrorMessage, String userCode, String companyCode, Gender gender, DateTime? dateOfBirth, String userName, String email, String employeeId, bool isEdit
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
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? apiErrorMessage = null,Object? userCode = null,Object? companyCode = null,Object? gender = null,Object? dateOfBirth = freezed,Object? userName = null,Object? email = null,Object? employeeId = null,Object? isEdit = null,}) {
  return _then(_SettingState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,apiErrorMessage: null == apiErrorMessage ? _self.apiErrorMessage : apiErrorMessage // ignore: cast_nullable_to_non_nullable
as String,userCode: null == userCode ? _self.userCode : userCode // ignore: cast_nullable_to_non_nullable
as String,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,isEdit: null == isEdit ? _self.isEdit : isEdit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
