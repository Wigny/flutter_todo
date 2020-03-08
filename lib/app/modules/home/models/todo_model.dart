import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  DocumentReference reference;
  int id;
  String title;
  bool check;
  Timestamp date;

  TodoModel({
    this.reference,
    this.id,
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

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        title: json['title'],
        check: json['check'],
        date: json['date'],
      );
}
