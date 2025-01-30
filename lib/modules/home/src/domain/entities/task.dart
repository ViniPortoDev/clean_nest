<<<<<<< HEAD
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_nest/core/entities/member.dart';

class Task {
  final int id;
=======
import 'package:clean_nest/core/domain/entities/member.dart';

class Task {
  final int id;
  final String title;
  final String description;
>>>>>>> refs/remotes/origin/feat/auth-setup-profile
  final String type;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;
  final String group;
  final String category;
  final List<Member> members;

<<<<<<< HEAD
  Task(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.dueDate,
      required this.isCompleted,
      required this.group,
      required this.category,
      required this.members});

  Task copyWith({
    int? id,
    String? type,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
    String? group,
    String? category,
    List<Member>? members,
  }) {
    return Task(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      group: group ?? this.group,
      category: category ?? this.category,
      members: members ?? this.members,
    );
  }
=======
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.group,
    required this.category,
    required this.members,
    
  });
>>>>>>> refs/remotes/origin/feat/auth-setup-profile
}
