// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seeds_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeedsState {

 String get message; List<Seed> get seeds;
/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedsStateCopyWith<SeedsState> get copyWith => _$SeedsStateCopyWithImpl<SeedsState>(this as SeedsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedsState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.seeds, seeds));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(seeds));

@override
String toString() {
  return 'SeedsState(message: $message, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class $SeedsStateCopyWith<$Res>  {
  factory $SeedsStateCopyWith(SeedsState value, $Res Function(SeedsState) _then) = _$SeedsStateCopyWithImpl;
@useResult
$Res call({
 String message, List<Seed> seeds
});




}
/// @nodoc
class _$SeedsStateCopyWithImpl<$Res>
    implements $SeedsStateCopyWith<$Res> {
  _$SeedsStateCopyWithImpl(this._self, this._then);

  final SeedsState _self;
  final $Res Function(SeedsState) _then;

/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? seeds = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedsState].
extension SeedsStatePatterns on SeedsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Processing$SeedsState value)?  processing,TResult Function( Idle$SeedsState value)?  idle,TResult Function( Failure$SeedsState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Processing$SeedsState() when processing != null:
return processing(_that);case Idle$SeedsState() when idle != null:
return idle(_that);case Failure$SeedsState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Processing$SeedsState value)  processing,required TResult Function( Idle$SeedsState value)  idle,required TResult Function( Failure$SeedsState value)  failure,}){
final _that = this;
switch (_that) {
case Processing$SeedsState():
return processing(_that);case Idle$SeedsState():
return idle(_that);case Failure$SeedsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Processing$SeedsState value)?  processing,TResult? Function( Idle$SeedsState value)?  idle,TResult? Function( Failure$SeedsState value)?  failure,}){
final _that = this;
switch (_that) {
case Processing$SeedsState() when processing != null:
return processing(_that);case Idle$SeedsState() when idle != null:
return idle(_that);case Failure$SeedsState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  List<Seed> seeds)?  processing,TResult Function( String message,  List<Seed> seeds)?  idle,TResult Function( String message,  List<Seed> seeds)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Processing$SeedsState() when processing != null:
return processing(_that.message,_that.seeds);case Idle$SeedsState() when idle != null:
return idle(_that.message,_that.seeds);case Failure$SeedsState() when failure != null:
return failure(_that.message,_that.seeds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  List<Seed> seeds)  processing,required TResult Function( String message,  List<Seed> seeds)  idle,required TResult Function( String message,  List<Seed> seeds)  failure,}) {final _that = this;
switch (_that) {
case Processing$SeedsState():
return processing(_that.message,_that.seeds);case Idle$SeedsState():
return idle(_that.message,_that.seeds);case Failure$SeedsState():
return failure(_that.message,_that.seeds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  List<Seed> seeds)?  processing,TResult? Function( String message,  List<Seed> seeds)?  idle,TResult? Function( String message,  List<Seed> seeds)?  failure,}) {final _that = this;
switch (_that) {
case Processing$SeedsState() when processing != null:
return processing(_that.message,_that.seeds);case Idle$SeedsState() when idle != null:
return idle(_that.message,_that.seeds);case Failure$SeedsState() when failure != null:
return failure(_that.message,_that.seeds);case _:
  return null;

}
}

}

/// @nodoc


class Processing$SeedsState extends SeedsState {
  const Processing$SeedsState({this.message = 'processing', final  List<Seed> seeds = const []}): _seeds = seeds,super._();
  

@override@JsonKey() final  String message;
 final  List<Seed> _seeds;
@override@JsonKey() List<Seed> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}


/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Processing$SeedsStateCopyWith<Processing$SeedsState> get copyWith => _$Processing$SeedsStateCopyWithImpl<Processing$SeedsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Processing$SeedsState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._seeds, _seeds));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_seeds));

@override
String toString() {
  return 'SeedsState.processing(message: $message, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class $Processing$SeedsStateCopyWith<$Res> implements $SeedsStateCopyWith<$Res> {
  factory $Processing$SeedsStateCopyWith(Processing$SeedsState value, $Res Function(Processing$SeedsState) _then) = _$Processing$SeedsStateCopyWithImpl;
@override @useResult
$Res call({
 String message, List<Seed> seeds
});




}
/// @nodoc
class _$Processing$SeedsStateCopyWithImpl<$Res>
    implements $Processing$SeedsStateCopyWith<$Res> {
  _$Processing$SeedsStateCopyWithImpl(this._self, this._then);

  final Processing$SeedsState _self;
  final $Res Function(Processing$SeedsState) _then;

/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? seeds = null,}) {
  return _then(Processing$SeedsState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,
  ));
}


}

/// @nodoc


class Idle$SeedsState extends SeedsState {
  const Idle$SeedsState({this.message = 'idle', final  List<Seed> seeds = const []}): _seeds = seeds,super._();
  

@override@JsonKey() final  String message;
 final  List<Seed> _seeds;
@override@JsonKey() List<Seed> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}


/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Idle$SeedsStateCopyWith<Idle$SeedsState> get copyWith => _$Idle$SeedsStateCopyWithImpl<Idle$SeedsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle$SeedsState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._seeds, _seeds));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_seeds));

@override
String toString() {
  return 'SeedsState.idle(message: $message, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class $Idle$SeedsStateCopyWith<$Res> implements $SeedsStateCopyWith<$Res> {
  factory $Idle$SeedsStateCopyWith(Idle$SeedsState value, $Res Function(Idle$SeedsState) _then) = _$Idle$SeedsStateCopyWithImpl;
@override @useResult
$Res call({
 String message, List<Seed> seeds
});




}
/// @nodoc
class _$Idle$SeedsStateCopyWithImpl<$Res>
    implements $Idle$SeedsStateCopyWith<$Res> {
  _$Idle$SeedsStateCopyWithImpl(this._self, this._then);

  final Idle$SeedsState _self;
  final $Res Function(Idle$SeedsState) _then;

/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? seeds = null,}) {
  return _then(Idle$SeedsState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,
  ));
}


}

/// @nodoc


class Failure$SeedsState extends SeedsState {
  const Failure$SeedsState({this.message = 'failure', final  List<Seed> seeds = const []}): _seeds = seeds,super._();
  

@override@JsonKey() final  String message;
 final  List<Seed> _seeds;
@override@JsonKey() List<Seed> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}


/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Failure$SeedsStateCopyWith<Failure$SeedsState> get copyWith => _$Failure$SeedsStateCopyWithImpl<Failure$SeedsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure$SeedsState&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._seeds, _seeds));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_seeds));

@override
String toString() {
  return 'SeedsState.failure(message: $message, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class $Failure$SeedsStateCopyWith<$Res> implements $SeedsStateCopyWith<$Res> {
  factory $Failure$SeedsStateCopyWith(Failure$SeedsState value, $Res Function(Failure$SeedsState) _then) = _$Failure$SeedsStateCopyWithImpl;
@override @useResult
$Res call({
 String message, List<Seed> seeds
});




}
/// @nodoc
class _$Failure$SeedsStateCopyWithImpl<$Res>
    implements $Failure$SeedsStateCopyWith<$Res> {
  _$Failure$SeedsStateCopyWithImpl(this._self, this._then);

  final Failure$SeedsState _self;
  final $Res Function(Failure$SeedsState) _then;

/// Create a copy of SeedsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? seeds = null,}) {
  return _then(Failure$SeedsState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,
  ));
}


}

// dart format on
