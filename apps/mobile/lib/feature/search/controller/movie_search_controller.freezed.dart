// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_search_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String get message; SearchData? get data;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'SearchState(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String message, SearchData? data
});


$SearchDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SearchData?,
  ));
}
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SearchDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Processing$SearchState value)?  processing,TResult Function( Idle$SearchState value)?  idle,TResult Function( Failure$SearchState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Processing$SearchState() when processing != null:
return processing(_that);case Idle$SearchState() when idle != null:
return idle(_that);case Failure$SearchState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Processing$SearchState value)  processing,required TResult Function( Idle$SearchState value)  idle,required TResult Function( Failure$SearchState value)  failure,}){
final _that = this;
switch (_that) {
case Processing$SearchState():
return processing(_that);case Idle$SearchState():
return idle(_that);case Failure$SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Processing$SearchState value)?  processing,TResult? Function( Idle$SearchState value)?  idle,TResult? Function( Failure$SearchState value)?  failure,}){
final _that = this;
switch (_that) {
case Processing$SearchState() when processing != null:
return processing(_that);case Idle$SearchState() when idle != null:
return idle(_that);case Failure$SearchState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  SearchData? data)?  processing,TResult Function( String message,  SearchData? data)?  idle,TResult Function( String message,  SearchData? data)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Processing$SearchState() when processing != null:
return processing(_that.message,_that.data);case Idle$SearchState() when idle != null:
return idle(_that.message,_that.data);case Failure$SearchState() when failure != null:
return failure(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  SearchData? data)  processing,required TResult Function( String message,  SearchData? data)  idle,required TResult Function( String message,  SearchData? data)  failure,}) {final _that = this;
switch (_that) {
case Processing$SearchState():
return processing(_that.message,_that.data);case Idle$SearchState():
return idle(_that.message,_that.data);case Failure$SearchState():
return failure(_that.message,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  SearchData? data)?  processing,TResult? Function( String message,  SearchData? data)?  idle,TResult? Function( String message,  SearchData? data)?  failure,}) {final _that = this;
switch (_that) {
case Processing$SearchState() when processing != null:
return processing(_that.message,_that.data);case Idle$SearchState() when idle != null:
return idle(_that.message,_that.data);case Failure$SearchState() when failure != null:
return failure(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class Processing$SearchState extends SearchState {
  const Processing$SearchState({this.message = 'processing', this.data}): super._();
  

@override@JsonKey() final  String message;
@override final  SearchData? data;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Processing$SearchStateCopyWith<Processing$SearchState> get copyWith => _$Processing$SearchStateCopyWithImpl<Processing$SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Processing$SearchState&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'SearchState.processing(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $Processing$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $Processing$SearchStateCopyWith(Processing$SearchState value, $Res Function(Processing$SearchState) _then) = _$Processing$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String message, SearchData? data
});


@override $SearchDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$Processing$SearchStateCopyWithImpl<$Res>
    implements $Processing$SearchStateCopyWith<$Res> {
  _$Processing$SearchStateCopyWithImpl(this._self, this._then);

  final Processing$SearchState _self;
  final $Res Function(Processing$SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(Processing$SearchState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SearchData?,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SearchDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class Idle$SearchState extends SearchState {
  const Idle$SearchState({this.message = 'idle', this.data}): super._();
  

@override@JsonKey() final  String message;
@override final  SearchData? data;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Idle$SearchStateCopyWith<Idle$SearchState> get copyWith => _$Idle$SearchStateCopyWithImpl<Idle$SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle$SearchState&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'SearchState.idle(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $Idle$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $Idle$SearchStateCopyWith(Idle$SearchState value, $Res Function(Idle$SearchState) _then) = _$Idle$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String message, SearchData? data
});


@override $SearchDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$Idle$SearchStateCopyWithImpl<$Res>
    implements $Idle$SearchStateCopyWith<$Res> {
  _$Idle$SearchStateCopyWithImpl(this._self, this._then);

  final Idle$SearchState _self;
  final $Res Function(Idle$SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(Idle$SearchState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SearchData?,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SearchDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class Failure$SearchState extends SearchState {
  const Failure$SearchState({this.message = 'failure', this.data}): super._();
  

@override@JsonKey() final  String message;
@override final  SearchData? data;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Failure$SearchStateCopyWith<Failure$SearchState> get copyWith => _$Failure$SearchStateCopyWithImpl<Failure$SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure$SearchState&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'SearchState.failure(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $Failure$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $Failure$SearchStateCopyWith(Failure$SearchState value, $Res Function(Failure$SearchState) _then) = _$Failure$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String message, SearchData? data
});


@override $SearchDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$Failure$SearchStateCopyWithImpl<$Res>
    implements $Failure$SearchStateCopyWith<$Res> {
  _$Failure$SearchStateCopyWithImpl(this._self, this._then);

  final Failure$SearchState _self;
  final $Res Function(Failure$SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(Failure$SearchState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SearchData?,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SearchDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
