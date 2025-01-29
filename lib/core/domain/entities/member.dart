import 'package:clean_nest/modules/home/src/domain/entities/task.dart';

class Member {
  final int id;
  final String name;
  final String email;
  final List<Task> tasks;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.tasks,
  });
}