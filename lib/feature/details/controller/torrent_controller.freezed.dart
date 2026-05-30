// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'torrent_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TorrentState {

 String get message;
/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorrentStateCopyWith<TorrentState> get copyWith => _$TorrentStateCopyWithImpl<TorrentState>(this as TorrentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorrentState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TorrentState(message: $message)';
}


}

/// @nodoc
abstract mixin class $TorrentStateCopyWith<$Res>  {
  factory $TorrentStateCopyWith(TorrentState value, $Res Function(TorrentState) _then) = _$TorrentStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TorrentStateCopyWithImpl<$Res>
    implements $TorrentStateCopyWith<$Res> {
  _$TorrentStateCopyWithImpl(this._self, this._then);

  final TorrentState _self;
  final $Res Function(TorrentState) _then;

/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TorrentState].
extension TorrentStatePatterns on TorrentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Processing$TorrentState value)?  processing,TResult Function( Idle$TorrentState value)?  idle,TResult Function( Failure$TorrentState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Processing$TorrentState() when processing != null:
return processing(_that);case Idle$TorrentState() when idle != null:
return idle(_that);case Failure$TorrentState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Processing$TorrentState value)  processing,required TResult Function( Idle$TorrentState value)  idle,required TResult Function( Failure$TorrentState value)  failure,}){
final _that = this;
switch (_that) {
case Processing$TorrentState():
return processing(_that);case Idle$TorrentState():
return idle(_that);case Failure$TorrentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Processing$TorrentState value)?  processing,TResult? Function( Idle$TorrentState value)?  idle,TResult? Function( Failure$TorrentState value)?  failure,}){
final _that = this;
switch (_that) {
case Processing$TorrentState() when processing != null:
return processing(_that);case Idle$TorrentState() when idle != null:
return idle(_that);case Failure$TorrentState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  processing,TResult Function( String message)?  idle,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Processing$TorrentState() when processing != null:
return processing(_that.message);case Idle$TorrentState() when idle != null:
return idle(_that.message);case Failure$TorrentState() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  processing,required TResult Function( String message)  idle,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case Processing$TorrentState():
return processing(_that.message);case Idle$TorrentState():
return idle(_that.message);case Failure$TorrentState():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  processing,TResult? Function( String message)?  idle,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case Processing$TorrentState() when processing != null:
return processing(_that.message);case Idle$TorrentState() when idle != null:
return idle(_that.message);case Failure$TorrentState() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Processing$TorrentState extends TorrentState {
  const Processing$TorrentState({this.message = 'processing'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Processing$TorrentStateCopyWith<Processing$TorrentState> get copyWith => _$Processing$TorrentStateCopyWithImpl<Processing$TorrentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Processing$TorrentState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TorrentState.processing(message: $message)';
}


}

/// @nodoc
abstract mixin class $Processing$TorrentStateCopyWith<$Res> implements $TorrentStateCopyWith<$Res> {
  factory $Processing$TorrentStateCopyWith(Processing$TorrentState value, $Res Function(Processing$TorrentState) _then) = _$Processing$TorrentStateCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$Processing$TorrentStateCopyWithImpl<$Res>
    implements $Processing$TorrentStateCopyWith<$Res> {
  _$Processing$TorrentStateCopyWithImpl(this._self, this._then);

  final Processing$TorrentState _self;
  final $Res Function(Processing$TorrentState) _then;

/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Processing$TorrentState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Idle$TorrentState extends TorrentState {
  const Idle$TorrentState({this.message = 'idle'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Idle$TorrentStateCopyWith<Idle$TorrentState> get copyWith => _$Idle$TorrentStateCopyWithImpl<Idle$TorrentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle$TorrentState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TorrentState.idle(message: $message)';
}


}

/// @nodoc
abstract mixin class $Idle$TorrentStateCopyWith<$Res> implements $TorrentStateCopyWith<$Res> {
  factory $Idle$TorrentStateCopyWith(Idle$TorrentState value, $Res Function(Idle$TorrentState) _then) = _$Idle$TorrentStateCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$Idle$TorrentStateCopyWithImpl<$Res>
    implements $Idle$TorrentStateCopyWith<$Res> {
  _$Idle$TorrentStateCopyWithImpl(this._self, this._then);

  final Idle$TorrentState _self;
  final $Res Function(Idle$TorrentState) _then;

/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Idle$TorrentState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Failure$TorrentState extends TorrentState {
  const Failure$TorrentState({this.message = 'failure'}): super._();
  

@override@JsonKey() final  String message;

/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Failure$TorrentStateCopyWith<Failure$TorrentState> get copyWith => _$Failure$TorrentStateCopyWithImpl<Failure$TorrentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure$TorrentState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TorrentState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $Failure$TorrentStateCopyWith<$Res> implements $TorrentStateCopyWith<$Res> {
  factory $Failure$TorrentStateCopyWith(Failure$TorrentState value, $Res Function(Failure$TorrentState) _then) = _$Failure$TorrentStateCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$Failure$TorrentStateCopyWithImpl<$Res>
    implements $Failure$TorrentStateCopyWith<$Res> {
  _$Failure$TorrentStateCopyWithImpl(this._self, this._then);

  final Failure$TorrentState _self;
  final $Res Function(Failure$TorrentState) _then;

/// Create a copy of TorrentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure$TorrentState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
