// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailState {

 String get message; MovieDetails? get movie;
/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailStateCopyWith<MovieDetailState> get copyWith => _$MovieDetailStateCopyWithImpl<MovieDetailState>(this as MovieDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailState&&(identical(other.message, message) || other.message == message)&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,message,movie);

@override
String toString() {
  return 'MovieDetailState(message: $message, movie: $movie)';
}


}

/// @nodoc
abstract mixin class $MovieDetailStateCopyWith<$Res>  {
  factory $MovieDetailStateCopyWith(MovieDetailState value, $Res Function(MovieDetailState) _then) = _$MovieDetailStateCopyWithImpl;
@useResult
$Res call({
 String message, MovieDetails? movie
});


$MovieDetailsCopyWith<$Res>? get movie;

}
/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._self, this._then);

  final MovieDetailState _self;
  final $Res Function(MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? movie = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,movie: freezed == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as MovieDetails?,
  ));
}
/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailsCopyWith<$Res>? get movie {
    if (_self.movie == null) {
    return null;
  }

  return $MovieDetailsCopyWith<$Res>(_self.movie!, (value) {
    return _then(_self.copyWith(movie: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieDetailState].
extension MovieDetailStatePatterns on MovieDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Processing$MovieDetailState value)?  processing,TResult Function( Idle$MovieDetailState value)?  idle,TResult Function( Failure$MovieDetailState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Processing$MovieDetailState() when processing != null:
return processing(_that);case Idle$MovieDetailState() when idle != null:
return idle(_that);case Failure$MovieDetailState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Processing$MovieDetailState value)  processing,required TResult Function( Idle$MovieDetailState value)  idle,required TResult Function( Failure$MovieDetailState value)  failure,}){
final _that = this;
switch (_that) {
case Processing$MovieDetailState():
return processing(_that);case Idle$MovieDetailState():
return idle(_that);case Failure$MovieDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Processing$MovieDetailState value)?  processing,TResult? Function( Idle$MovieDetailState value)?  idle,TResult? Function( Failure$MovieDetailState value)?  failure,}){
final _that = this;
switch (_that) {
case Processing$MovieDetailState() when processing != null:
return processing(_that);case Idle$MovieDetailState() when idle != null:
return idle(_that);case Failure$MovieDetailState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  MovieDetails? movie)?  processing,TResult Function( String message,  MovieDetails? movie)?  idle,TResult Function( String message,  MovieDetails? movie)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Processing$MovieDetailState() when processing != null:
return processing(_that.message,_that.movie);case Idle$MovieDetailState() when idle != null:
return idle(_that.message,_that.movie);case Failure$MovieDetailState() when failure != null:
return failure(_that.message,_that.movie);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  MovieDetails? movie)  processing,required TResult Function( String message,  MovieDetails? movie)  idle,required TResult Function( String message,  MovieDetails? movie)  failure,}) {final _that = this;
switch (_that) {
case Processing$MovieDetailState():
return processing(_that.message,_that.movie);case Idle$MovieDetailState():
return idle(_that.message,_that.movie);case Failure$MovieDetailState():
return failure(_that.message,_that.movie);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  MovieDetails? movie)?  processing,TResult? Function( String message,  MovieDetails? movie)?  idle,TResult? Function( String message,  MovieDetails? movie)?  failure,}) {final _that = this;
switch (_that) {
case Processing$MovieDetailState() when processing != null:
return processing(_that.message,_that.movie);case Idle$MovieDetailState() when idle != null:
return idle(_that.message,_that.movie);case Failure$MovieDetailState() when failure != null:
return failure(_that.message,_that.movie);case _:
  return null;

}
}

}

/// @nodoc


class Processing$MovieDetailState extends MovieDetailState {
  const Processing$MovieDetailState({this.message = 'processing', this.movie}): super._();
  

@override@JsonKey() final  String message;
@override final  MovieDetails? movie;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Processing$MovieDetailStateCopyWith<Processing$MovieDetailState> get copyWith => _$Processing$MovieDetailStateCopyWithImpl<Processing$MovieDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Processing$MovieDetailState&&(identical(other.message, message) || other.message == message)&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,message,movie);

@override
String toString() {
  return 'MovieDetailState.processing(message: $message, movie: $movie)';
}


}

/// @nodoc
abstract mixin class $Processing$MovieDetailStateCopyWith<$Res> implements $MovieDetailStateCopyWith<$Res> {
  factory $Processing$MovieDetailStateCopyWith(Processing$MovieDetailState value, $Res Function(Processing$MovieDetailState) _then) = _$Processing$MovieDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String message, MovieDetails? movie
});


@override $MovieDetailsCopyWith<$Res>? get movie;

}
/// @nodoc
class _$Processing$MovieDetailStateCopyWithImpl<$Res>
    implements $Processing$MovieDetailStateCopyWith<$Res> {
  _$Processing$MovieDetailStateCopyWithImpl(this._self, this._then);

  final Processing$MovieDetailState _self;
  final $Res Function(Processing$MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? movie = freezed,}) {
  return _then(Processing$MovieDetailState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,movie: freezed == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as MovieDetails?,
  ));
}

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailsCopyWith<$Res>? get movie {
    if (_self.movie == null) {
    return null;
  }

  return $MovieDetailsCopyWith<$Res>(_self.movie!, (value) {
    return _then(_self.copyWith(movie: value));
  });
}
}

/// @nodoc


class Idle$MovieDetailState extends MovieDetailState {
  const Idle$MovieDetailState({this.message = 'idle', this.movie}): super._();
  

@override@JsonKey() final  String message;
@override final  MovieDetails? movie;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Idle$MovieDetailStateCopyWith<Idle$MovieDetailState> get copyWith => _$Idle$MovieDetailStateCopyWithImpl<Idle$MovieDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle$MovieDetailState&&(identical(other.message, message) || other.message == message)&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,message,movie);

@override
String toString() {
  return 'MovieDetailState.idle(message: $message, movie: $movie)';
}


}

/// @nodoc
abstract mixin class $Idle$MovieDetailStateCopyWith<$Res> implements $MovieDetailStateCopyWith<$Res> {
  factory $Idle$MovieDetailStateCopyWith(Idle$MovieDetailState value, $Res Function(Idle$MovieDetailState) _then) = _$Idle$MovieDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String message, MovieDetails? movie
});


@override $MovieDetailsCopyWith<$Res>? get movie;

}
/// @nodoc
class _$Idle$MovieDetailStateCopyWithImpl<$Res>
    implements $Idle$MovieDetailStateCopyWith<$Res> {
  _$Idle$MovieDetailStateCopyWithImpl(this._self, this._then);

  final Idle$MovieDetailState _self;
  final $Res Function(Idle$MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? movie = freezed,}) {
  return _then(Idle$MovieDetailState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,movie: freezed == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as MovieDetails?,
  ));
}

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailsCopyWith<$Res>? get movie {
    if (_self.movie == null) {
    return null;
  }

  return $MovieDetailsCopyWith<$Res>(_self.movie!, (value) {
    return _then(_self.copyWith(movie: value));
  });
}
}

/// @nodoc


class Failure$MovieDetailState extends MovieDetailState {
  const Failure$MovieDetailState({this.message = 'failure', this.movie}): super._();
  

@override@JsonKey() final  String message;
@override final  MovieDetails? movie;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Failure$MovieDetailStateCopyWith<Failure$MovieDetailState> get copyWith => _$Failure$MovieDetailStateCopyWithImpl<Failure$MovieDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure$MovieDetailState&&(identical(other.message, message) || other.message == message)&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,message,movie);

@override
String toString() {
  return 'MovieDetailState.failure(message: $message, movie: $movie)';
}


}

/// @nodoc
abstract mixin class $Failure$MovieDetailStateCopyWith<$Res> implements $MovieDetailStateCopyWith<$Res> {
  factory $Failure$MovieDetailStateCopyWith(Failure$MovieDetailState value, $Res Function(Failure$MovieDetailState) _then) = _$Failure$MovieDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String message, MovieDetails? movie
});


@override $MovieDetailsCopyWith<$Res>? get movie;

}
/// @nodoc
class _$Failure$MovieDetailStateCopyWithImpl<$Res>
    implements $Failure$MovieDetailStateCopyWith<$Res> {
  _$Failure$MovieDetailStateCopyWithImpl(this._self, this._then);

  final Failure$MovieDetailState _self;
  final $Res Function(Failure$MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? movie = freezed,}) {
  return _then(Failure$MovieDetailState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,movie: freezed == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as MovieDetails?,
  ));
}

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailsCopyWith<$Res>? get movie {
    if (_self.movie == null) {
    return null;
  }

  return $MovieDetailsCopyWith<$Res>(_self.movie!, (value) {
    return _then(_self.copyWith(movie: value));
  });
}
}

// dart format on
