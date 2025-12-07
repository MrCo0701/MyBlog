// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeltaOpModel {

 dynamic get insert; Map<String, dynamic>? get attributes;
/// Create a copy of DeltaOpModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeltaOpModelCopyWith<DeltaOpModel> get copyWith => _$DeltaOpModelCopyWithImpl<DeltaOpModel>(this as DeltaOpModel, _$identity);

  /// Serializes this DeltaOpModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeltaOpModel&&const DeepCollectionEquality().equals(other.insert, insert)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(insert),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'DeltaOpModel(insert: $insert, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $DeltaOpModelCopyWith<$Res>  {
  factory $DeltaOpModelCopyWith(DeltaOpModel value, $Res Function(DeltaOpModel) _then) = _$DeltaOpModelCopyWithImpl;
@useResult
$Res call({
 dynamic insert, Map<String, dynamic>? attributes
});




}
/// @nodoc
class _$DeltaOpModelCopyWithImpl<$Res>
    implements $DeltaOpModelCopyWith<$Res> {
  _$DeltaOpModelCopyWithImpl(this._self, this._then);

  final DeltaOpModel _self;
  final $Res Function(DeltaOpModel) _then;

/// Create a copy of DeltaOpModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? insert = freezed,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
insert: freezed == insert ? _self.insert : insert // ignore: cast_nullable_to_non_nullable
as dynamic,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeltaOpModel].
extension DeltaOpModelPatterns on DeltaOpModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeltaOpModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeltaOpModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeltaOpModel value)  $default,){
final _that = this;
switch (_that) {
case _DeltaOpModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeltaOpModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeltaOpModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic insert,  Map<String, dynamic>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeltaOpModel() when $default != null:
return $default(_that.insert,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic insert,  Map<String, dynamic>? attributes)  $default,) {final _that = this;
switch (_that) {
case _DeltaOpModel():
return $default(_that.insert,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic insert,  Map<String, dynamic>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _DeltaOpModel() when $default != null:
return $default(_that.insert,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeltaOpModel implements DeltaOpModel {
  const _DeltaOpModel({required this.insert, final  Map<String, dynamic>? attributes}): _attributes = attributes;
  factory _DeltaOpModel.fromJson(Map<String, dynamic> json) => _$DeltaOpModelFromJson(json);

@override final  dynamic insert;
 final  Map<String, dynamic>? _attributes;
@override Map<String, dynamic>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DeltaOpModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeltaOpModelCopyWith<_DeltaOpModel> get copyWith => __$DeltaOpModelCopyWithImpl<_DeltaOpModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeltaOpModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeltaOpModel&&const DeepCollectionEquality().equals(other.insert, insert)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(insert),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'DeltaOpModel(insert: $insert, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$DeltaOpModelCopyWith<$Res> implements $DeltaOpModelCopyWith<$Res> {
  factory _$DeltaOpModelCopyWith(_DeltaOpModel value, $Res Function(_DeltaOpModel) _then) = __$DeltaOpModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic insert, Map<String, dynamic>? attributes
});




}
/// @nodoc
class __$DeltaOpModelCopyWithImpl<$Res>
    implements _$DeltaOpModelCopyWith<$Res> {
  __$DeltaOpModelCopyWithImpl(this._self, this._then);

  final _DeltaOpModel _self;
  final $Res Function(_DeltaOpModel) _then;

/// Create a copy of DeltaOpModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? insert = freezed,Object? attributes = freezed,}) {
  return _then(_DeltaOpModel(
insert: freezed == insert ? _self.insert : insert // ignore: cast_nullable_to_non_nullable
as dynamic,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
