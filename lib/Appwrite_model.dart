import 'package:appwrite/models.dart';

class Task {
  
  final String title;
  final bool completed;

  Task({ required this.title, required this.completed});

  factory Task.fromDocument(Document doc) {
    return Task(
         title: doc.data['task'], completed: doc.data['completed']);
  }
}