// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetSeriesState {

 List<SeriesWithCountModel> get listSeries; SeriesDetailModel get seriesDetail;
/// Create a copy of GetSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSeriesStateCopyWith<GetSeriesState> get copyWith => _$GetSeriesStateCopyWithImpl<GetSeriesState>(this as GetSeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSeriesState&&const DeepCollectionEquality().equals(other.listSeries, listSeries)&&(identical(other.seriesDetail, seriesDetail) || other.seriesDetail == seriesDetail));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(listSeries),seriesDetail);

@override
String toString() {
  return 'GetSeriesState(listSeries: $listSeries, seriesDetail: $seriesDetail)';
}


}

/// @nodoc
abstract mixin class $GetSeriesStateCopyWith<$Res>  {
  factory $GetSeriesStateCopyWith(GetSeriesState value, $Res Function(GetSeriesState) _then) = _$GetSeriesStateCopyWithImpl;
@useResult
$Res call({
 List<SeriesWithCountModel> listSeries, SeriesDetailModel seriesDetail
});


$SeriesDetailModelCopyWith<$Res> get seriesDetail;

}
/// @nodoc
class _$GetSeriesStateCopyWithImpl<$Res>
    implements $GetSeriesStateCopyWith<$Res> {
  _$GetSeriesStateCopyWithImpl(this._self, this._then);

  final GetSeriesState _self;
  final $Res Function(GetSeriesState) _then;

/// Create a copy of GetSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listSeries = null,Object? seriesDetail = null,}) {
  return _then(_self.copyWith(
listSeries: null == listSeries ? _self.listSeries : listSeries // ignore: cast_nullable_to_non_nullable
as List<SeriesWithCountModel>,seriesDetail: null == seriesDetail ? _self.seriesDetail : seriesDetail // ignore: cast_nullable_to_non_nullable
as SeriesDetailModel,
  ));
}
/// Create a copy of GetSeriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesDetailModelCopyWith<$Res> get seriesDetail {
  
  return $SeriesDetailModelCopyWith<$Res>(_self.seriesDetail, (value) {
    return _then(_self.copyWith(seriesDetail: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetSeriesState].
extension GetSeriesStatePatterns on GetSeriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSeriesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSeriesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSeriesState value)  $default,){
final _that = this;
switch (_that) {
case _GetSeriesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSeriesState value)?  $default,){
final _that = this;
switch (_that) {
case _GetSeriesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SeriesWithCountModel> listSeries,  SeriesDetailModel seriesDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetSeriesState() when $default != null:
return $default(_that.listSeries,_that.seriesDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SeriesWithCountModel> listSeries,  SeriesDetailModel seriesDetail)  $default,) {final _that = this;
switch (_that) {
case _GetSeriesState():
return $default(_that.listSeries,_that.seriesDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SeriesWithCountModel> listSeries,  SeriesDetailModel seriesDetail)?  $default,) {final _that = this;
switch (_that) {
case _GetSeriesState() when $default != null:
return $default(_that.listSeries,_that.seriesDetail);case _:
  return null;

}
}

}

/// @nodoc


class _GetSeriesState implements GetSeriesState {
  const _GetSeriesState({required final  List<SeriesWithCountModel> listSeries, required this.seriesDetail}): _listSeries = listSeries;
  

 final  List<SeriesWithCountModel> _listSeries;
@override List<SeriesWithCountModel> get listSeries {
  if (_listSeries is EqualUnmodifiableListView) return _listSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listSeries);
}

@override final  SeriesDetailModel seriesDetail;

/// Create a copy of GetSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSeriesStateCopyWith<_GetSeriesState> get copyWith => __$GetSeriesStateCopyWithImpl<_GetSeriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSeriesState&&const DeepCollectionEquality().equals(other._listSeries, _listSeries)&&(identical(other.seriesDetail, seriesDetail) || other.seriesDetail == seriesDetail));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listSeries),seriesDetail);

@override
String toString() {
  return 'GetSeriesState(listSeries: $listSeries, seriesDetail: $seriesDetail)';
}


}

/// @nodoc
abstract mixin class _$GetSeriesStateCopyWith<$Res> implements $GetSeriesStateCopyWith<$Res> {
  factory _$GetSeriesStateCopyWith(_GetSeriesState value, $Res Function(_GetSeriesState) _then) = __$GetSeriesStateCopyWithImpl;
@override @useResult
$Res call({
 List<SeriesWithCountModel> listSeries, SeriesDetailModel seriesDetail
});


@override $SeriesDetailModelCopyWith<$Res> get seriesDetail;

}
/// @nodoc
class __$GetSeriesStateCopyWithImpl<$Res>
    implements _$GetSeriesStateCopyWith<$Res> {
  __$GetSeriesStateCopyWithImpl(this._self, this._then);

  final _GetSeriesState _self;
  final $Res Function(_GetSeriesState) _then;

/// Create a copy of GetSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listSeries = null,Object? seriesDetail = null,}) {
  return _then(_GetSeriesState(
listSeries: null == listSeries ? _self._listSeries : listSeries // ignore: cast_nullable_to_non_nullable
as List<SeriesWithCountModel>,seriesDetail: null == seriesDetail ? _self.seriesDetail : seriesDetail // ignore: cast_nullable_to_non_nullable
as SeriesDetailModel,
  ));
}

/// Create a copy of GetSeriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeriesDetailModelCopyWith<$Res> get seriesDetail {
  
  return $SeriesDetailModelCopyWith<$Res>(_self.seriesDetail, (value) {
    return _then(_self.copyWith(seriesDetail: value));
  });
}
}

// dart format on
