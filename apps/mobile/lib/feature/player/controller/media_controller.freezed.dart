// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaState {

 String get message; List<HlsVariant> get variants; HlsVariant? get selected; double get rate; Object? get error;
/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStateCopyWith<MediaState> get copyWith => _$MediaStateCopyWithImpl<MediaState>(this as MediaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.variants, variants)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(variants),selected,rate,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'MediaState(message: $message, variants: $variants, selected: $selected, rate: $rate, error: $error)';
}


}

/// @nodoc
abstract mixin class $MediaStateCopyWith<$Res>  {
  factory $MediaStateCopyWith(MediaState value, $Res Function(MediaState) _then) = _$MediaStateCopyWithImpl;
@useResult
$Res call({
 String message, List<HlsVariant> variants, HlsVariant? selected, double rate, Object? error
});


$HlsVariantCopyWith<$Res>? get selected;

}
/// @nodoc
class _$MediaStateCopyWithImpl<$Res>
    implements $MediaStateCopyWith<$Res> {
  _$MediaStateCopyWithImpl(this._self, this._then);

  final MediaState _self;
  final $Res Function(MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? variants = null,Object? selected = freezed,Object? rate = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<HlsVariant>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as HlsVariant?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error ,
  ));
}
/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HlsVariantCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $HlsVariantCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}


/// Adds pattern-matching-related methods to [MediaState].
extension MediaStatePatterns on MediaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Processing$MediaState value)?  processing,TResult Function( Idle$MediaState value)?  idle,TResult Function( Failure$MediaState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Processing$MediaState() when processing != null:
return processing(_that);case Idle$MediaState() when idle != null:
return idle(_that);case Failure$MediaState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Processing$MediaState value)  processing,required TResult Function( Idle$MediaState value)  idle,required TResult Function( Failure$MediaState value)  failure,}){
final _that = this;
switch (_that) {
case Processing$MediaState():
return processing(_that);case Idle$MediaState():
return idle(_that);case Failure$MediaState():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Processing$MediaState value)?  processing,TResult? Function( Idle$MediaState value)?  idle,TResult? Function( Failure$MediaState value)?  failure,}){
final _that = this;
switch (_that) {
case Processing$MediaState() when processing != null:
return processing(_that);case Idle$MediaState() when idle != null:
return idle(_that);case Failure$MediaState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)?  processing,TResult Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)?  idle,TResult Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Processing$MediaState() when processing != null:
return processing(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case Idle$MediaState() when idle != null:
return idle(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case Failure$MediaState() when failure != null:
return failure(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)  processing,required TResult Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)  idle,required TResult Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)  failure,}) {final _that = this;
switch (_that) {
case Processing$MediaState():
return processing(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case Idle$MediaState():
return idle(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case Failure$MediaState():
return failure(_that.message,_that.variants,_that.selected,_that.rate,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)?  processing,TResult? Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)?  idle,TResult? Function( String message,  List<HlsVariant> variants,  HlsVariant? selected,  double rate,  Object? error)?  failure,}) {final _that = this;
switch (_that) {
case Processing$MediaState() when processing != null:
return processing(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case Idle$MediaState() when idle != null:
return idle(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case Failure$MediaState() when failure != null:
return failure(_that.message,_that.variants,_that.selected,_that.rate,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class Processing$MediaState extends MediaState {
  const Processing$MediaState({this.message = 'processing', final  List<HlsVariant> variants = const <HlsVariant>[], this.selected, this.rate = 1.0, this.error}): _variants = variants,super._();
  

@override@JsonKey() final  String message;
 final  List<HlsVariant> _variants;
@override@JsonKey() List<HlsVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override final  HlsVariant? selected;
@override@JsonKey() final  double rate;
@override final  Object? error;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Processing$MediaStateCopyWith<Processing$MediaState> get copyWith => _$Processing$MediaStateCopyWithImpl<Processing$MediaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Processing$MediaState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._variants, _variants)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_variants),selected,rate,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'MediaState.processing(message: $message, variants: $variants, selected: $selected, rate: $rate, error: $error)';
}


}

/// @nodoc
abstract mixin class $Processing$MediaStateCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory $Processing$MediaStateCopyWith(Processing$MediaState value, $Res Function(Processing$MediaState) _then) = _$Processing$MediaStateCopyWithImpl;
@override @useResult
$Res call({
 String message, List<HlsVariant> variants, HlsVariant? selected, double rate, Object? error
});


@override $HlsVariantCopyWith<$Res>? get selected;

}
/// @nodoc
class _$Processing$MediaStateCopyWithImpl<$Res>
    implements $Processing$MediaStateCopyWith<$Res> {
  _$Processing$MediaStateCopyWithImpl(this._self, this._then);

  final Processing$MediaState _self;
  final $Res Function(Processing$MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? variants = null,Object? selected = freezed,Object? rate = null,Object? error = freezed,}) {
  return _then(Processing$MediaState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<HlsVariant>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as HlsVariant?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error ,
  ));
}

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HlsVariantCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $HlsVariantCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

/// @nodoc


class Idle$MediaState extends MediaState {
  const Idle$MediaState({this.message = 'idle', final  List<HlsVariant> variants = const <HlsVariant>[], this.selected, this.rate = 1.0, this.error}): _variants = variants,super._();
  

@override@JsonKey() final  String message;
 final  List<HlsVariant> _variants;
@override@JsonKey() List<HlsVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override final  HlsVariant? selected;
@override@JsonKey() final  double rate;
@override final  Object? error;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Idle$MediaStateCopyWith<Idle$MediaState> get copyWith => _$Idle$MediaStateCopyWithImpl<Idle$MediaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle$MediaState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._variants, _variants)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_variants),selected,rate,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'MediaState.idle(message: $message, variants: $variants, selected: $selected, rate: $rate, error: $error)';
}


}

/// @nodoc
abstract mixin class $Idle$MediaStateCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory $Idle$MediaStateCopyWith(Idle$MediaState value, $Res Function(Idle$MediaState) _then) = _$Idle$MediaStateCopyWithImpl;
@override @useResult
$Res call({
 String message, List<HlsVariant> variants, HlsVariant? selected, double rate, Object? error
});


@override $HlsVariantCopyWith<$Res>? get selected;

}
/// @nodoc
class _$Idle$MediaStateCopyWithImpl<$Res>
    implements $Idle$MediaStateCopyWith<$Res> {
  _$Idle$MediaStateCopyWithImpl(this._self, this._then);

  final Idle$MediaState _self;
  final $Res Function(Idle$MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? variants = null,Object? selected = freezed,Object? rate = null,Object? error = freezed,}) {
  return _then(Idle$MediaState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<HlsVariant>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as HlsVariant?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error ,
  ));
}

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HlsVariantCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $HlsVariantCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

/// @nodoc


class Failure$MediaState extends MediaState {
  const Failure$MediaState({this.message = 'failure', final  List<HlsVariant> variants = const <HlsVariant>[], this.selected, this.rate = 1.0, this.error}): _variants = variants,super._();
  

@override@JsonKey() final  String message;
 final  List<HlsVariant> _variants;
@override@JsonKey() List<HlsVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override final  HlsVariant? selected;
@override@JsonKey() final  double rate;
@override final  Object? error;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Failure$MediaStateCopyWith<Failure$MediaState> get copyWith => _$Failure$MediaStateCopyWithImpl<Failure$MediaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure$MediaState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._variants, _variants)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_variants),selected,rate,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'MediaState.failure(message: $message, variants: $variants, selected: $selected, rate: $rate, error: $error)';
}


}

/// @nodoc
abstract mixin class $Failure$MediaStateCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory $Failure$MediaStateCopyWith(Failure$MediaState value, $Res Function(Failure$MediaState) _then) = _$Failure$MediaStateCopyWithImpl;
@override @useResult
$Res call({
 String message, List<HlsVariant> variants, HlsVariant? selected, double rate, Object? error
});


@override $HlsVariantCopyWith<$Res>? get selected;

}
/// @nodoc
class _$Failure$MediaStateCopyWithImpl<$Res>
    implements $Failure$MediaStateCopyWith<$Res> {
  _$Failure$MediaStateCopyWithImpl(this._self, this._then);

  final Failure$MediaState _self;
  final $Res Function(Failure$MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? variants = null,Object? selected = freezed,Object? rate = null,Object? error = freezed,}) {
  return _then(Failure$MediaState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<HlsVariant>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as HlsVariant?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,error: freezed == error ? _self.error : error ,
  ));
}

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HlsVariantCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $HlsVariantCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

// dart format on
