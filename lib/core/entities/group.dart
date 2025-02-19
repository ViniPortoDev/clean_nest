// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_nest/core/entities/member.dart';
import 'package:clean_nest/modules/home/src/domain/entities/task.dart';

class Group {
  final int id;
  final String name;
  final List<Member> members;
  final List<Task> tasks;

  Group(
      {required this.id,
      required this.name,
      required this.members,
      required this.tasks});

  Group copyWith({
    int? id,
    String? name,
    List<Member>? members,
    List<Task>? tasks,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      members: members ?? List.unmodifiable(this.members),
      tasks: tasks ?? List.unmodifiable(this.tasks),
    );
  }
}
