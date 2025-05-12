import 'package:clean_nest/features/home/src/domain/entities/task.dart';
import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {}

class AddTask extends TaskEvent {
  final String title;
  final String? description;
  AddTask({required this.title, this.description});

  @override
  List<Object?> get props => [title, description];
}

class EditTask extends TaskEvent {
  final Task task;
  EditTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;
  DeleteTask({required this.task});

  @override
  List<Object?> get props => [task];
}
