import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/modules/home/models/todo_model.dart';
import 'package:flutter_todo/app/modules/home/repositories/todo_repository_interface.dart';

class TodoFirebaseRepository implements ITodoRepository {
  final Firestore firestore;

  TodoFirebaseRepository(this.firestore);

  @override
  Stream<List<TodoModel>> get todos {
    return firestore.collection('todo').orderBy('date').snapshots().map(
          (query) => query.documents
              .map(
                (doc) => TodoModel.fromDocument(doc),
              )
              .toList(),
        );
  }

  @override
  Future<void> save(TodoModel model) {
    return (model.reference == null) ? _add(model) : _update(model);
  }

  Future<void> _add(TodoModel model) async {
    model.reference = await Firestore.instance.collection('todo').add({
      "title": model.title,
      "check": model.check,
      'date': DateTime.now(),
    });
  }

  Future<void> _update(TodoModel model) async {
    model.reference.updateData({
      "title": model.title,
      "check": model.check,
      'date': model.date,
      'reference': model.reference,
    });
  }

  @override
  Future<void> delete(TodoModel model) async {
    await model.reference.delete();
  }
}
