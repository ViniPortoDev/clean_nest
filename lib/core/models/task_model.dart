import 'package:clean_nest/core/models/member_model.dart';
import 'package:clean_nest/modules/home/src/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required super.id,
    required super.type,
    required super.title,
    required super.description,
    required super.dueDate,
    required super.isCompleted,
    required super.group,
    required super.category,
    required super.members,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'isCompleted': isCompleted,
      'group': group,
      'category': category,
      'members': members,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      description: json['description'],
      dueDate: json['dueDate'],
      isCompleted: json['isCompleted'],
      group: json['group'],
      category: json['category'],
      members: List<MemberModel>.from(
          json['members'].map((member) => MemberModel.fromMap(member))),
    );
  }
}
