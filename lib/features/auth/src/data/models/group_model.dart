import 'package:clean_nest/core/entities/group.dart';
import 'package:clean_nest/core/models/member_model.dart';
import 'package:clean_nest/core/models/task_model.dart';

class GroupModel extends Group {
  GroupModel({
    required super.id,
    required super.name,
    required super.members,
    required super.tasks,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'members': members,
      'tasks': tasks,
    };
  }
    factory GroupModel.fromEntity(Group group) {
    return GroupModel(
      id: group.id,
      name: group.name,
      members: group.members, // Se você precisar de um mapeamento específico para membros
      tasks: group.tasks, // Se você precisar de um mapeamento específico para tarefas
    );
  }

  factory GroupModel.fromMap(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'],
      name: json['name'],
      members: List<MemberModel>.from(
          json['members'].map((member) => MemberModel.fromMap(member))),
      tasks: List<TaskModel>.from(
          json['tasks'].map((task) => TaskModel.fromMap(task))),
    );
  }
}
