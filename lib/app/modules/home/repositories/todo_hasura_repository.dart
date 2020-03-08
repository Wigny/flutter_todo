import 'package:flutter_todo/app/modules/home/documents/todo_document.dart';
import 'package:flutter_todo/app/modules/home/models/todo_model.dart';
import 'package:flutter_todo/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';

class TodoHasuraRepository implements ITodoRepository {
  final HasuraConnect connect;

  TodoHasuraRepository(this.connect);

  @override
  Stream<List<TodoModel>> get todos => connect.subscription(subscription).map(
        (res) => res['data']['todos']
            .map<TodoModel>(
              (json) => TodoModel.fromJson(json),
            )
            .toList(),
      );

  @override
  Future<void> save(TodoModel model) async {
    if (model.id == null) {
      await _add(model);
    } else {
      _update(model);
    }
  }

  Future<void> _add(TodoModel model) async {
    Map<String, dynamic> data = await connect.mutation(
      insert,
      variables: {
        'title': model.title,
      },
    );

    model.id = data['data']['insert_todos']['returning'][0]['id'];
  }

  Future _update(TodoModel model) async {
    await connect.mutation(
      update,
      variables: {
        'title': model.title,
        'check': model.check,
        'id': model.id,
      },
    );
  }

  @override
  Future delete(TodoModel model) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
