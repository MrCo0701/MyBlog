// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriesDetailModel {

 int get id; String get title; String get slug; String get description; String get createdAt; AuthorModel get author; List<BlogModel> get posts;
/// Create a copy of SeriesDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesDetailModelCopyWith<SeriesDetailModel> get copyWith => _$SeriesDetailModelCopyWithImpl<SeriesDetailModel>(this as SeriesDetailModel, _$identity);

  /// Serializes this SeriesDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other.posts, posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,description,createdAt,author,const DeepCollectionEquality().hash(posts));

@override
String toString() {
  return 'SeriesDetailModel(id: $id, title: $title, slug: $slug, description: $description, createdAt: $createdAt, author: $author, posts: $posts)';
}


}

/// @nodoc
abstract mixin class $SeriesDetailModelCopyWith<$Res>  {
  factory $SeriesDetailModelCopyWith(SeriesDetailModel value, $Res Function(SeriesDetailModel) _then) = _$SeriesDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String slug, String description, String createdAt, AuthorModel author, List<BlogModel> posts
});




}
/// @nodoc
class _$SeriesDetailModelCopyWithImpl<$Res>
    implements $SeriesDetailModelCopyWith<$Res> {
  _$SeriesDetailModelCopyWithImpl(this._self, this._then);

  final SeriesDetailModel _self;
  final $Res Function(SeriesDetailModel) _then;

/// Create a copy of SeriesDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? description = null,Object? createdAt = null,Object? author = null,Object? posts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as AuthorModel,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<BlogModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesDetailModel].
extension SeriesDetailModelPatterns on SeriesDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _SeriesDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String slug,  String description,  String createdAt,  AuthorModel author,  List<BlogModel> posts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.createdAt,_that.author,_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String slug,  String description,  String createdAt,  AuthorModel author,  List<BlogModel> posts)  $default,) {final _that = this;
switch (_that) {
case _SeriesDetailModel():
return $default(_that.id,_that.title,_that.slug,_that.description,_that.createdAt,_that.author,_that.posts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String slug,  String description,  String createdAt,  AuthorModel author,  List<BlogModel> posts)?  $default,) {final _that = this;
switch (_that) {
case _SeriesDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.createdAt,_that.author,_that.posts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesDetailModel implements SeriesDetailModel {
  const _SeriesDetailModel({required this.id, required this.title, required this.slug, required this.description, required this.createdAt, required this.author, required final  List<BlogModel> posts}): _posts = posts;
  factory _SeriesDetailModel.fromJson(Map<String, dynamic> json) => _$SeriesDetailModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String slug;
@override final  String description;
@override final  String createdAt;
@override final  AuthorModel author;
 final  List<BlogModel> _posts;
@override List<BlogModel> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of SeriesDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesDetailModelCopyWith<_SeriesDetailModel> get copyWith => __$SeriesDetailModelCopyWithImpl<_SeriesDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other._posts, _posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,description,createdAt,author,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'SeriesDetailModel(id: $id, title: $title, slug: $slug, description: $description, createdAt: $createdAt, author: $author, posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$SeriesDetailModelCopyWith<$Res> implements $SeriesDetailModelCopyWith<$Res> {
  factory _$SeriesDetailModelCopyWith(_SeriesDetailModel value, $Res Function(_SeriesDetailModel) _then) = __$SeriesDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String slug, String description, String createdAt, AuthorModel author, List<BlogModel> posts
});




}
/// @nodoc
class __$SeriesDetailModelCopyWithImpl<$Res>
    implements _$SeriesDetailModelCopyWith<$Res> {
  __$SeriesDetailModelCopyWithImpl(this._self, this._then);

  final _SeriesDetailModel _self;
  final $Res Function(_SeriesDetailModel) _then;

/// Create a copy of SeriesDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? description = null,Object? createdAt = null,Object? author = null,Object? posts = null,}) {
  return _then(_SeriesDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as AuthorModel,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<BlogModel>,
  ));
}


}

// dart format on
