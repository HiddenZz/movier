// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hls_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HlsVariant {

 String get quality; int get bandwidth; int? get width; int? get height;
/// Create a copy of HlsVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HlsVariantCopyWith<HlsVariant> get copyWith => _$HlsVariantCopyWithImpl<HlsVariant>(this as HlsVariant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HlsVariant&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,quality,bandwidth,width,height);

@override
String toString() {
  return 'HlsVariant(quality: $quality, bandwidth: $bandwidth, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $HlsVariantCopyWith<$Res>  {
  factory $HlsVariantCopyWith(HlsVariant value, $Res Function(HlsVariant) _then) = _$HlsVariantCopyWithImpl;
@useResult
$Res call({
 String quality, int bandwidth, int? width, int? height
});




}
/// @nodoc
class _$HlsVariantCopyWithImpl<$Res>
    implements $HlsVariantCopyWith<$Res> {
  _$HlsVariantCopyWithImpl(this._self, this._then);

  final HlsVariant _self;
  final $Res Function(HlsVariant) _then;

/// Create a copy of HlsVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quality = null,Object? bandwidth = null,Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HlsVariant].
extension HlsVariantPatterns on HlsVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HlsVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HlsVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HlsVariant value)  $default,){
final _that = this;
switch (_that) {
case _HlsVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HlsVariant value)?  $default,){
final _that = this;
switch (_that) {
case _HlsVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String quality,  int bandwidth,  int? width,  int? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HlsVariant() when $default != null:
return $default(_that.quality,_that.bandwidth,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String quality,  int bandwidth,  int? width,  int? height)  $default,) {final _that = this;
switch (_that) {
case _HlsVariant():
return $default(_that.quality,_that.bandwidth,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String quality,  int bandwidth,  int? width,  int? height)?  $default,) {final _that = this;
switch (_that) {
case _HlsVariant() when $default != null:
return $default(_that.quality,_that.bandwidth,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc


class _HlsVariant extends HlsVariant {
  const _HlsVariant({required this.quality, this.bandwidth = 0, this.width, this.height}): super._();
  

@override final  String quality;
@override@JsonKey() final  int bandwidth;
@override final  int? width;
@override final  int? height;

/// Create a copy of HlsVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HlsVariantCopyWith<_HlsVariant> get copyWith => __$HlsVariantCopyWithImpl<_HlsVariant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HlsVariant&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.bandwidth, bandwidth) || other.bandwidth == bandwidth)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,quality,bandwidth,width,height);

@override
String toString() {
  return 'HlsVariant(quality: $quality, bandwidth: $bandwidth, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$HlsVariantCopyWith<$Res> implements $HlsVariantCopyWith<$Res> {
  factory _$HlsVariantCopyWith(_HlsVariant value, $Res Function(_HlsVariant) _then) = __$HlsVariantCopyWithImpl;
@override @useResult
$Res call({
 String quality, int bandwidth, int? width, int? height
});




}
/// @nodoc
class __$HlsVariantCopyWithImpl<$Res>
    implements _$HlsVariantCopyWith<$Res> {
  __$HlsVariantCopyWithImpl(this._self, this._then);

  final _HlsVariant _self;
  final $Res Function(_HlsVariant) _then;

/// Create a copy of HlsVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quality = null,Object? bandwidth = null,Object? width = freezed,Object? height = freezed,}) {
  return _then(_HlsVariant(
quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,bandwidth: null == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as int,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
