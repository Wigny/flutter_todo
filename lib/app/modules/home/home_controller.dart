import 'package:flutter_todo/app/modules/home/models/todo_model.dart';
import 'package:flutter_todo/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final ITodoRepository repository;

  _HomeBase(ITodoRepository this.repository) {
    getList();
  }

  @observable
  ObservableStream<List<TodoModel>> todoList;

  @action
  getList() {
    todoList = repository.todos.asObservable();
  }

  Future save(TodoModel model) => repository.save(model);

  Future delete(TodoModel model) => repository.delete(model);
}
