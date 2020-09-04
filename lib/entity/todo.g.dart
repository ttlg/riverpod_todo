// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$_$_TodoFromJson(Map json) {
  return _$_Todo(
    json['content'] as String,
    json['done'] as bool,
    json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    json['uid'] as String,
  );
}

Map<String, dynamic> _$_$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'content': instance.content,
      'done': instance.done,
      'timestamp': instance.timestamp?.toIso8601String(),
      'uid': instance.uid,
    };
