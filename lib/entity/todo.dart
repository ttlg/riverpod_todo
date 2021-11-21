class Todo {
  final String content;
  final bool done;
  final DateTime timestamp;
  final String id;

//<editor-fold desc="Data Methods">

  Todo({
    required this.content,
    required this.done,
    required this.timestamp,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          done == other.done &&
          timestamp == other.timestamp &&
          id == other.id);

  @override
  int get hashCode =>
      content.hashCode ^ done.hashCode ^ timestamp.hashCode ^ id.hashCode;

  @override
  String toString() {
    return 'Todo{' +
        ' content: $content,' +
        ' done: $done,' +
        ' timestamp: $timestamp,' +
        ' id: $id,' +
        '}';
  }

  Todo copyWith({
    String? content,
    bool? done,
    DateTime? timestamp,
    String? id,
  }) {
    return Todo(
      content: content ?? this.content,
      done: done ?? this.done,
      timestamp: timestamp ?? this.timestamp,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': this.content,
      'done': this.done,
      'timestamp': this.timestamp.toIso8601String(),
      'id': this.id,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      content: map['content'] as String,
      done: map['done'] as bool,
      timestamp: DateTime.parse(map['timestamp']),
      id: map['id'] as String,
    );
  }

//</editor-fold>
}
