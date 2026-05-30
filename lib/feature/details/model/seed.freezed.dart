// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Seed {

 String get guid; String get title; String get externalLink; int get tmdbId;
/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedCopyWith<Seed> get copyWith => _$SeedCopyWithImpl<Seed>(this as Seed, _$identity);

  /// Serializes this Seed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seed&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.title, title) || other.title == title)&&(identical(other.externalLink, externalLink) || other.externalLink == externalLink)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,guid,title,externalLink,tmdbId);

@override
String toString() {
  return 'Seed(guid: $guid, title: $title, externalLink: $externalLink, tmdbId: $tmdbId)';
}


}

/// @nodoc
abstract mixin class $SeedCopyWith<$Res>  {
  factory $SeedCopyWith(Seed value, $Res Function(Seed) _then) = _$SeedCopyWithImpl;
@useResult
$Res call({
 String guid, String title, String externalLink, int tmdbId
});




}
/// @nodoc
class _$SeedCopyWithImpl<$Res>
    implements $SeedCopyWith<$Res> {
  _$SeedCopyWithImpl(this._self, this._then);

  final Seed _self;
  final $Res Function(Seed) _then;

/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guid = null,Object? title = null,Object? externalLink = null,Object? tmdbId = null,}) {
  return _then(_self.copyWith(
guid: null == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,externalLink: null == externalLink ? _self.externalLink : externalLink // ignore: cast_nullable_to_non_nullable
as String,tmdbId: null == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Seed].
extension SeedPatterns on Seed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seed value)  $default,){
final _that = this;
switch (_that) {
case _Seed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seed value)?  $default,){
final _that = this;
switch (_that) {
case _Seed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String guid,  String title,  String externalLink,  int tmdbId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seed() when $default != null:
return $default(_that.guid,_that.title,_that.externalLink,_that.tmdbId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String guid,  String title,  String externalLink,  int tmdbId)  $default,) {final _that = this;
switch (_that) {
case _Seed():
return $default(_that.guid,_that.title,_that.externalLink,_that.tmdbId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String guid,  String title,  String externalLink,  int tmdbId)?  $default,) {final _that = this;
switch (_that) {
case _Seed() when $default != null:
return $default(_that.guid,_that.title,_that.externalLink,_that.tmdbId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seed extends Seed {
  const _Seed({required this.guid, required this.title, required this.externalLink, required this.tmdbId}): super._();
  factory _Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);

@override final  String guid;
@override final  String title;
@override final  String externalLink;
@override final  int tmdbId;

/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedCopyWith<_Seed> get copyWith => __$SeedCopyWithImpl<_Seed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seed&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.title, title) || other.title == title)&&(identical(other.externalLink, externalLink) || other.externalLink == externalLink)&&(identical(other.tmdbId, tmdbId) || other.tmdbId == tmdbId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,guid,title,externalLink,tmdbId);

@override
String toString() {
  return 'Seed(guid: $guid, title: $title, externalLink: $externalLink, tmdbId: $tmdbId)';
}


}

/// @nodoc
abstract mixin class _$SeedCopyWith<$Res> implements $SeedCopyWith<$Res> {
  factory _$SeedCopyWith(_Seed value, $Res Function(_Seed) _then) = __$SeedCopyWithImpl;
@override @useResult
$Res call({
 String guid, String title, String externalLink, int tmdbId
});




}
/// @nodoc
class __$SeedCopyWithImpl<$Res>
    implements _$SeedCopyWith<$Res> {
  __$SeedCopyWithImpl(this._self, this._then);

  final _Seed _self;
  final $Res Function(_Seed) _then;

/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guid = null,Object? title = null,Object? externalLink = null,Object? tmdbId = null,}) {
  return _then(_Seed(
guid: null == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,externalLink: null == externalLink ? _self.externalLink : externalLink // ignore: cast_nullable_to_non_nullable
as String,tmdbId: null == tmdbId ? _self.tmdbId : tmdbId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
