import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/app/modules/home/models/todo_model.dart';
import 'package:firebase_todo/app/modules/home/repositories/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  final Firestore firestore;

  TodoRepository(this.firestore);

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
  Future save(TodoModel model) async {
    Map<String, dynamic> data = {
      'title': model.title,
      'check': model.check,
      'date': model.date ?? DateTime.now(),
    };

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('todo').add(data);
    } else {
      model.reference.updateData(data);
    }
  }

  @override
  Future delete(TodoModel model) {
    return model.reference.delete();
  }
}
