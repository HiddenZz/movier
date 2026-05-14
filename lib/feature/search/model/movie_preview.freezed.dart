// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoviePreview {

 int get id; String get title; String get overview; String get posterPath; String get originalTitle; double get popularity;
/// Create a copy of MoviePreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoviePreviewCopyWith<MoviePreview> get copyWith => _$MoviePreviewCopyWithImpl<MoviePreview>(this as MoviePreview, _$identity);

  /// Serializes this MoviePreview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviePreview&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.popularity, popularity) || other.popularity == popularity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,overview,posterPath,originalTitle,popularity);

@override
String toString() {
  return 'MoviePreview(id: $id, title: $title, overview: $overview, posterPath: $posterPath, originalTitle: $originalTitle, popularity: $popularity)';
}


}

/// @nodoc
abstract mixin class $MoviePreviewCopyWith<$Res>  {
  factory $MoviePreviewCopyWith(MoviePreview value, $Res Function(MoviePreview) _then) = _$MoviePreviewCopyWithImpl;
@useResult
$Res call({
 int id, String title, String overview, String posterPath, String originalTitle, double popularity
});




}
/// @nodoc
class _$MoviePreviewCopyWithImpl<$Res>
    implements $MoviePreviewCopyWith<$Res> {
  _$MoviePreviewCopyWithImpl(this._self, this._then);

  final MoviePreview _self;
  final $Res Function(MoviePreview) _then;

/// Create a copy of MoviePreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? overview = null,Object? posterPath = null,Object? originalTitle = null,Object? popularity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MoviePreview].
extension MoviePreviewPatterns on MoviePreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoviePreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoviePreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoviePreview value)  $default,){
final _that = this;
switch (_that) {
case _MoviePreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoviePreview value)?  $default,){
final _that = this;
switch (_that) {
case _MoviePreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String overview,  String posterPath,  String originalTitle,  double popularity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoviePreview() when $default != null:
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.originalTitle,_that.popularity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String overview,  String posterPath,  String originalTitle,  double popularity)  $default,) {final _that = this;
switch (_that) {
case _MoviePreview():
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.originalTitle,_that.popularity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String overview,  String posterPath,  String originalTitle,  double popularity)?  $default,) {final _that = this;
switch (_that) {
case _MoviePreview() when $default != null:
return $default(_that.id,_that.title,_that.overview,_that.posterPath,_that.originalTitle,_that.popularity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoviePreview extends MoviePreview {
  const _MoviePreview({required this.id, required this.title, required this.overview, required this.posterPath, required this.originalTitle, this.popularity = .0}): super._();
  factory _MoviePreview.fromJson(Map<String, dynamic> json) => _$MoviePreviewFromJson(json);

@override final  int id;
@override final  String title;
@override final  String overview;
@override final  String posterPath;
@override final  String originalTitle;
@override@JsonKey() final  double popularity;

/// Create a copy of MoviePreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoviePreviewCopyWith<_MoviePreview> get copyWith => __$MoviePreviewCopyWithImpl<_MoviePreview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoviePreviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoviePreview&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.popularity, popularity) || other.popularity == popularity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,overview,posterPath,originalTitle,popularity);

@override
String toString() {
  return 'MoviePreview(id: $id, title: $title, overview: $overview, posterPath: $posterPath, originalTitle: $originalTitle, popularity: $popularity)';
}


}

/// @nodoc
abstract mixin class _$MoviePreviewCopyWith<$Res> implements $MoviePreviewCopyWith<$Res> {
  factory _$MoviePreviewCopyWith(_MoviePreview value, $Res Function(_MoviePreview) _then) = __$MoviePreviewCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String overview, String posterPath, String originalTitle, double popularity
});




}
/// @nodoc
class __$MoviePreviewCopyWithImpl<$Res>
    implements _$MoviePreviewCopyWith<$Res> {
  __$MoviePreviewCopyWithImpl(this._self, this._then);

  final _MoviePreview _self;
  final $Res Function(_MoviePreview) _then;

/// Create a copy of MoviePreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? overview = null,Object? posterPath = null,Object? originalTitle = null,Object? popularity = null,}) {
  return _then(_MoviePreview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
