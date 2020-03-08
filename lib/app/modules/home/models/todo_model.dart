import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  DocumentReference reference;
  String title;
  bool check;
  Timestamp date;

  TodoModel({
    this.reference,
    this.title = '',
    this.check = false,
    this.date,
  });

  factory TodoModel.fromDocument(DocumentSnapshot doc) => TodoModel(
        reference: doc.reference,
        title: doc['title'],
        check: doc['check'],
        date: doc['date'],
      );

  Future<void> save() async {
    Map<String, dynamic> data = {
      'title': title,
      'check': check,
      'date': date ?? DateTime.now(),
    };

    if (reference == null) {
      reference = await Firestore.instance.collection('todo').add(data);
    } else {
      reference.updateData(data);
    }
  }

  Future<void> delete() {
    return reference.delete();
  }
}
