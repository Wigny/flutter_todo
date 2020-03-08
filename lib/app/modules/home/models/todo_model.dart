import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  DocumentReference reference;
  int id;
  String title;
  bool check;
  DateTime date;

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
        date: (doc['date'] as Timestamp).toDate(),
      );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        title: json['title'],
        check: json['check'],
        date: DateTime.parse(json['date']),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "title": title,
      "check": check,
      'date': date != null ? date.toIso8601String() : DateTime.now(),
      'reference': reference,
    };

    return json;
  }
}
