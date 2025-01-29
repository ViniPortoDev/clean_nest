import 'package:clean_nest/core/domain/entities/member.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final String type;
  final String group;
  final String category;
  final List<Member> members;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.group,
    required this.category,
    required this.members,
    
  });
}
