// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

class _$TodoTearOff {
  const _$TodoTearOff();

// ignore: unused_element
  _Todo call(String content, bool done, DateTime timestamp, String uid) {
    return _Todo(
      content,
      done,
      timestamp,
      uid,
    );
  }
}

// ignore: unused_element
const $Todo = _$TodoTearOff();

mixin _$Todo {
  String get content;
  bool get done;
  DateTime get timestamp;
  String get uid;

  Map<String, dynamic> toJson();
  $TodoCopyWith<Todo> get copyWith;
}

abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call({String content, bool done, DateTime timestamp, String uid});
}

class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object content = freezed,
    Object done = freezed,
    Object timestamp = freezed,
    Object uid = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed ? _value.content : content as String,
      done: done == freezed ? _value.done : done as bool,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
      uid: uid == freezed ? _value.uid : uid as String,
    ));
  }
}

abstract class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) then) =
      __$TodoCopyWithImpl<$Res>;
  @override
  $Res call({String content, bool done, DateTime timestamp, String uid});
}

class __$TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(_Todo _value, $Res Function(_Todo) _then)
      : super(_value, (v) => _then(v as _Todo));

  @override
  _Todo get _value => super._value as _Todo;

  @override
  $Res call({
    Object content = freezed,
    Object done = freezed,
    Object timestamp = freezed,
    Object uid = freezed,
  }) {
    return _then(_Todo(
      content == freezed ? _value.content : content as String,
      done == freezed ? _value.done : done as bool,
      timestamp == freezed ? _value.timestamp : timestamp as DateTime,
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

@JsonSerializable()
class _$_Todo with DiagnosticableTreeMixin implements _Todo {
  const _$_Todo(this.content, this.done, this.timestamp, this.uid)
      : assert(content != null),
        assert(done != null),
        assert(timestamp != null),
        assert(uid != null);

  factory _$_Todo.fromJson(Map<String, dynamic> json) =>
      _$_$_TodoFromJson(json);

  @override
  final String content;
  @override
  final bool done;
  @override
  final DateTime timestamp;
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(content: $content, done: $done, timestamp: $timestamp, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('done', done))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Todo &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(done) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(uid);

  @override
  _$TodoCopyWith<_Todo> get copyWith =>
      __$TodoCopyWithImpl<_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TodoToJson(this);
  }
}

abstract class _Todo implements Todo {
  const factory _Todo(
      String content, bool done, DateTime timestamp, String uid) = _$_Todo;

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  String get content;
  @override
  bool get done;
  @override
  DateTime get timestamp;
  @override
  String get uid;
  @override
  _$TodoCopyWith<_Todo> get copyWith;
}
