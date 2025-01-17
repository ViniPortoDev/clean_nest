import 'package:clean_nest/modules/home/src/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:clean_nest/core/domain/entities/member.dart';

class TaskViewModel extends ChangeNotifier {
  String _selectedGroup = 'Familia Porto';
  String _selectedCategory = 'Cozinha';
  List<Member> _selectedMembers = [];
  final List<Task> _tasks = [];

  // Getters
  String get selectedGroup => _selectedGroup;
  String get selectedCategory => _selectedCategory;
  List<Member> get selectedMembers => _selectedMembers;
  List<Task> get tasks => _tasks;

  // Métodos para atualizar o estado
  void updateGroup(String group) {
    _selectedGroup = group;
    notifyListeners();
  }

  void updateCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void updateMembers(List<Member> members) {
    _selectedMembers = members;
    notifyListeners();
  }

  // Método para adicionar a tarefa
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();  // Notifica a UI sobre a mudança
  }
}
