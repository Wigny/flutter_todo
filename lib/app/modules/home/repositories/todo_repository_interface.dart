import 'package:flutter_todo/app/modules/home/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> get todos;
  Future save(TodoModel model);
  Future delete(TodoModel model);
}
