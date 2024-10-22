import 'package:flutter_bloc_mitch/domain/models/todo.dart';
import 'package:isar/isar.dart';


part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String title;
  late bool isCompleted;

  Todo toDomain() {
    return Todo(
      id: id,
      text: title,
      isCompleted: isCompleted,
    );
  }

  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..title = todo.text
      ..isCompleted = todo.isCompleted;
  }
}