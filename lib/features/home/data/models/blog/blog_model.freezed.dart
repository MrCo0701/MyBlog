// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlogModel {

 String? get id; String? get title; List<DeltaOpModel> get content; bool get published; List<TagModel> get tags; int get readTime; int get viewCount; bool get isUpvoted; int get totalUpvotes; String? get createdAt; AuthorModel get author;
/// Create a copy of BlogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlogModelCopyWith<BlogModel> get copyWith => _$BlogModelCopyWithImpl<BlogModel>(this as BlogModel, _$identity);

  /// Serializes this BlogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.published, published) || other.published == published)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.readTime, readTime) || other.readTime == readTime)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.isUpvoted, isUpvoted) || other.isUpvoted == isUpvoted)&&(identical(other.totalUpvotes, totalUpvotes) || other.totalUpvotes == totalUpvotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(content),published,const DeepCollectionEquality().hash(tags),readTime,viewCount,isUpvoted,totalUpvotes,createdAt,author);

@override
String toString() {
  return 'BlogModel(id: $id, title: $title, content: $content, published: $published, tags: $tags, readTime: $readTime, viewCount: $viewCount, isUpvoted: $isUpvoted, totalUpvotes: $totalUpvotes, createdAt: $createdAt, author: $author)';
}


}

/// @nodoc
abstract mixin class $BlogModelCopyWith<$Res>  {
  factory $BlogModelCopyWith(BlogModel value, $Res Function(BlogModel) _then) = _$BlogModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, List<DeltaOpModel> content, bool published, List<TagModel> tags, int readTime, int viewCount, bool isUpvoted, int totalUpvotes, String? createdAt, AuthorModel author
});




}
/// @nodoc
class _$BlogModelCopyWithImpl<$Res>
    implements $BlogModelCopyWith<$Res> {
  _$BlogModelCopyWithImpl(this._self, this._then);

  final BlogModel _self;
  final $Res Function(BlogModel) _then;

/// Create a copy of BlogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? content = null,Object? published = null,Object? tags = null,Object? readTime = null,Object? viewCount = null,Object? isUpvoted = null,Object? totalUpvotes = null,Object? createdAt = freezed,Object? author = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<DeltaOpModel>,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagModel>,readTime: null == readTime ? _self.readTime : readTime // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,isUpvoted: null == isUpvoted ? _self.isUpvoted : isUpvoted // ignore: cast_nullable_to_non_nullable
as bool,totalUpvotes: null == totalUpvotes ? _self.totalUpvotes : totalUpvotes // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as AuthorModel,
  ));
}

}


/// Adds pattern-matching-related methods to [BlogModel].
extension BlogModelPatterns on BlogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlogModel value)  $default,){
final _that = this;
switch (_that) {
case _BlogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlogModel value)?  $default,){
final _that = this;
switch (_that) {
case _BlogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  List<DeltaOpModel> content,  bool published,  List<TagModel> tags,  int readTime,  int viewCount,  bool isUpvoted,  int totalUpvotes,  String? createdAt,  AuthorModel author)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlogModel() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.published,_that.tags,_that.readTime,_that.viewCount,_that.isUpvoted,_that.totalUpvotes,_that.createdAt,_that.author);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  List<DeltaOpModel> content,  bool published,  List<TagModel> tags,  int readTime,  int viewCount,  bool isUpvoted,  int totalUpvotes,  String? createdAt,  AuthorModel author)  $default,) {final _that = this;
switch (_that) {
case _BlogModel():
return $default(_that.id,_that.title,_that.content,_that.published,_that.tags,_that.readTime,_that.viewCount,_that.isUpvoted,_that.totalUpvotes,_that.createdAt,_that.author);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  List<DeltaOpModel> content,  bool published,  List<TagModel> tags,  int readTime,  int viewCount,  bool isUpvoted,  int totalUpvotes,  String? createdAt,  AuthorModel author)?  $default,) {final _that = this;
switch (_that) {
case _BlogModel() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.published,_that.tags,_that.readTime,_that.viewCount,_that.isUpvoted,_that.totalUpvotes,_that.createdAt,_that.author);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlogModel extends BlogModel {
  const _BlogModel({required this.id, required this.title, required final  List<DeltaOpModel> content, required this.published, required final  List<TagModel> tags, required this.readTime, required this.viewCount, required this.isUpvoted, required this.totalUpvotes, required this.createdAt, required this.author}): _content = content,_tags = tags,super._();
  factory _BlogModel.fromJson(Map<String, dynamic> json) => _$BlogModelFromJson(json);

@override final  String? id;
@override final  String? title;
 final  List<DeltaOpModel> _content;
@override List<DeltaOpModel> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  bool published;
 final  List<TagModel> _tags;
@override List<TagModel> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  int readTime;
@override final  int viewCount;
@override final  bool isUpvoted;
@override final  int totalUpvotes;
@override final  String? createdAt;
@override final  AuthorModel author;

/// Create a copy of BlogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlogModelCopyWith<_BlogModel> get copyWith => __$BlogModelCopyWithImpl<_BlogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.published, published) || other.published == published)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.readTime, readTime) || other.readTime == readTime)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.isUpvoted, isUpvoted) || other.isUpvoted == isUpvoted)&&(identical(other.totalUpvotes, totalUpvotes) || other.totalUpvotes == totalUpvotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_content),published,const DeepCollectionEquality().hash(_tags),readTime,viewCount,isUpvoted,totalUpvotes,createdAt,author);

@override
String toString() {
  return 'BlogModel(id: $id, title: $title, content: $content, published: $published, tags: $tags, readTime: $readTime, viewCount: $viewCount, isUpvoted: $isUpvoted, totalUpvotes: $totalUpvotes, createdAt: $createdAt, author: $author)';
}


}

/// @nodoc
abstract mixin class _$BlogModelCopyWith<$Res> implements $BlogModelCopyWith<$Res> {
  factory _$BlogModelCopyWith(_BlogModel value, $Res Function(_BlogModel) _then) = __$BlogModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, List<DeltaOpModel> content, bool published, List<TagModel> tags, int readTime, int viewCount, bool isUpvoted, int totalUpvotes, String? createdAt, AuthorModel author
});




}
/// @nodoc
class __$BlogModelCopyWithImpl<$Res>
    implements _$BlogModelCopyWith<$Res> {
  __$BlogModelCopyWithImpl(this._self, this._then);

  final _BlogModel _self;
  final $Res Function(_BlogModel) _then;

/// Create a copy of BlogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? content = null,Object? published = null,Object? tags = null,Object? readTime = null,Object? viewCount = null,Object? isUpvoted = null,Object? totalUpvotes = null,Object? createdAt = freezed,Object? author = null,}) {
  return _then(_BlogModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<DeltaOpModel>,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagModel>,readTime: null == readTime ? _self.readTime : readTime // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,isUpvoted: null == isUpvoted ? _self.isUpvoted : isUpvoted // ignore: cast_nullable_to_non_nullable
as bool,totalUpvotes: null == totalUpvotes ? _self.totalUpvotes : totalUpvotes // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as AuthorModel,
  ));
}


}

// dart format on
