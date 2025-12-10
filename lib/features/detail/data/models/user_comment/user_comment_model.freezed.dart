// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCommentModel {

 String get id; String get fullName; String? get avatarUrl;
/// Create a copy of UserCommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCommentModelCopyWith<UserCommentModel> get copyWith => _$UserCommentModelCopyWithImpl<UserCommentModel>(this as UserCommentModel, _$identity);

  /// Serializes this UserCommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl);

@override
String toString() {
  return 'UserCommentModel(id: $id, fullName: $fullName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UserCommentModelCopyWith<$Res>  {
  factory $UserCommentModelCopyWith(UserCommentModel value, $Res Function(UserCommentModel) _then) = _$UserCommentModelCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String? avatarUrl
});




}
/// @nodoc
class _$UserCommentModelCopyWithImpl<$Res>
    implements $UserCommentModelCopyWith<$Res> {
  _$UserCommentModelCopyWithImpl(this._self, this._then);

  final UserCommentModel _self;
  final $Res Function(UserCommentModel) _then;

/// Create a copy of UserCommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCommentModel].
extension UserCommentModelPatterns on UserCommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCommentModel value)  $default,){
final _that = this;
switch (_that) {
case _UserCommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserCommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCommentModel() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _UserCommentModel():
return $default(_that.id,_that.fullName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _UserCommentModel() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCommentModel implements UserCommentModel {
  const _UserCommentModel({required this.id, required this.fullName, required this.avatarUrl});
  factory _UserCommentModel.fromJson(Map<String, dynamic> json) => _$UserCommentModelFromJson(json);

@override final  String id;
@override final  String fullName;
@override final  String? avatarUrl;

/// Create a copy of UserCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCommentModelCopyWith<_UserCommentModel> get copyWith => __$UserCommentModelCopyWithImpl<_UserCommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl);

@override
String toString() {
  return 'UserCommentModel(id: $id, fullName: $fullName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UserCommentModelCopyWith<$Res> implements $UserCommentModelCopyWith<$Res> {
  factory _$UserCommentModelCopyWith(_UserCommentModel value, $Res Function(_UserCommentModel) _then) = __$UserCommentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String? avatarUrl
});




}
/// @nodoc
class __$UserCommentModelCopyWithImpl<$Res>
    implements _$UserCommentModelCopyWith<$Res> {
  __$UserCommentModelCopyWithImpl(this._self, this._then);

  final _UserCommentModel _self;
  final $Res Function(_UserCommentModel) _then;

/// Create a copy of UserCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? avatarUrl = freezed,}) {
  return _then(_UserCommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
