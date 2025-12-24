// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_with_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriesWithCountModel {

 int get id; String get title; String get description; String get slug; String get createdAt; AuthorModel get author;@JsonKey(name: '_count') CountSeriesModel get count;
/// Create a copy of SeriesWithCountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesWithCountModelCopyWith<SeriesWithCountModel> get copyWith => _$SeriesWithCountModelCopyWithImpl<SeriesWithCountModel>(this as SeriesWithCountModel, _$identity);

  /// Serializes this SeriesWithCountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesWithCountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,slug,createdAt,author,count);

@override
String toString() {
  return 'SeriesWithCountModel(id: $id, title: $title, description: $description, slug: $slug, createdAt: $createdAt, author: $author, count: $count)';
}


}

/// @nodoc
abstract mixin class $SeriesWithCountModelCopyWith<$Res>  {
  factory $SeriesWithCountModelCopyWith(SeriesWithCountModel value, $Res Function(SeriesWithCountModel) _then) = _$SeriesWithCountModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String slug, String createdAt, AuthorModel author,@JsonKey(name: '_count') CountSeriesModel count
});


$CountSeriesModelCopyWith<$Res> get count;

}
/// @nodoc
class _$SeriesWithCountModelCopyWithImpl<$Res>
    implements $SeriesWithCountModelCopyWith<$Res> {
  _$SeriesWithCountModelCopyWithImpl(this._self, this._then);

  final SeriesWithCountModel _self;
  final $Res Function(SeriesWithCountModel) _then;

/// Create a copy of SeriesWithCountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? slug = null,Object? createdAt = null,Object? author = null,Object? count = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as AuthorModel,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as CountSeriesModel,
  ));
}
/// Create a copy of SeriesWithCountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountSeriesModelCopyWith<$Res> get count {
  
  return $CountSeriesModelCopyWith<$Res>(_self.count, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeriesWithCountModel].
extension SeriesWithCountModelPatterns on SeriesWithCountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesWithCountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesWithCountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesWithCountModel value)  $default,){
final _that = this;
switch (_that) {
case _SeriesWithCountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesWithCountModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesWithCountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String slug,  String createdAt,  AuthorModel author, @JsonKey(name: '_count')  CountSeriesModel count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesWithCountModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.slug,_that.createdAt,_that.author,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String slug,  String createdAt,  AuthorModel author, @JsonKey(name: '_count')  CountSeriesModel count)  $default,) {final _that = this;
switch (_that) {
case _SeriesWithCountModel():
return $default(_that.id,_that.title,_that.description,_that.slug,_that.createdAt,_that.author,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  String slug,  String createdAt,  AuthorModel author, @JsonKey(name: '_count')  CountSeriesModel count)?  $default,) {final _that = this;
switch (_that) {
case _SeriesWithCountModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.slug,_that.createdAt,_that.author,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesWithCountModel implements SeriesWithCountModel {
  const _SeriesWithCountModel({required this.id, required this.title, required this.description, required this.slug, required this.createdAt, required this.author, @JsonKey(name: '_count') required this.count});
  factory _SeriesWithCountModel.fromJson(Map<String, dynamic> json) => _$SeriesWithCountModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String slug;
@override final  String createdAt;
@override final  AuthorModel author;
@override@JsonKey(name: '_count') final  CountSeriesModel count;

/// Create a copy of SeriesWithCountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesWithCountModelCopyWith<_SeriesWithCountModel> get copyWith => __$SeriesWithCountModelCopyWithImpl<_SeriesWithCountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesWithCountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesWithCountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,slug,createdAt,author,count);

@override
String toString() {
  return 'SeriesWithCountModel(id: $id, title: $title, description: $description, slug: $slug, createdAt: $createdAt, author: $author, count: $count)';
}


}

/// @nodoc
abstract mixin class _$SeriesWithCountModelCopyWith<$Res> implements $SeriesWithCountModelCopyWith<$Res> {
  factory _$SeriesWithCountModelCopyWith(_SeriesWithCountModel value, $Res Function(_SeriesWithCountModel) _then) = __$SeriesWithCountModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String slug, String createdAt, AuthorModel author,@JsonKey(name: '_count') CountSeriesModel count
});


@override $CountSeriesModelCopyWith<$Res> get count;

}
/// @nodoc
class __$SeriesWithCountModelCopyWithImpl<$Res>
    implements _$SeriesWithCountModelCopyWith<$Res> {
  __$SeriesWithCountModelCopyWithImpl(this._self, this._then);

  final _SeriesWithCountModel _self;
  final $Res Function(_SeriesWithCountModel) _then;

/// Create a copy of SeriesWithCountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? slug = null,Object? createdAt = null,Object? author = null,Object? count = null,}) {
  return _then(_SeriesWithCountModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as AuthorModel,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as CountSeriesModel,
  ));
}

/// Create a copy of SeriesWithCountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountSeriesModelCopyWith<$Res> get count {
  
  return $CountSeriesModelCopyWith<$Res>(_self.count, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}

// dart format on
