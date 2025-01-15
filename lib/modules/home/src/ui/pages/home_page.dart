import 'package:clean_nest/modules/home/src/domain/entities/task.dart';
import 'package:clean_nest/modules/home/src/ui/viewmodels/task_viewmodel.dart';
import 'package:clean_nest/modules/home/src/ui/widgets/add_task_container_widget.dart';
import 'package:clean_nest/modules/home/src/ui/widgets/select_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:clean_nest/core/domain/entities/member.dart';

class HomePage extends StatelessWidget {
  final TaskViewModel taskViewModel;
  const HomePage({super.key, required this.taskViewModel});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();
    final TextEditingController _typeController = TextEditingController();

    final List<Member> _members = [
      Member(id: 1, name: 'Membro 1', email: '', tasks: []),
      Member(id: 2, name: 'Membro 2', email: '', tasks: []),
      Member(id: 3, name: 'Membro 3', email: '', tasks: []),
    ];

    return Scaffold(
      appBar: AppBar(
        title: SelectedGroupWidget(
          groupName: taskViewModel.selectedGroup,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: const EdgeInsets.all(16),
                height: 300,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Opções de Grupos", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          const Text('Olá Vinicius Porto'),
          const SizedBox(height: 16),
          // Mostrar o container de adicionar tarefa apenas se não houver tarefas
          if (taskViewModel.tasks.isEmpty)
            AddTaskContainerWidget(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Adicionar nova tarefa"),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Título da Tarefa',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Descrição',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _typeController,
                          decoration: const InputDecoration(
                            labelText: 'Tipo',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButton<String>(
                          value: taskViewModel.selectedGroup,
                          onChanged: (String? newValue) {
                            taskViewModel.updateGroup(newValue!);
                          },
                          items: <String>['Familia Porto']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        DropdownButton<String>(
                          value: taskViewModel.selectedCategory,
                          onChanged: (String? newValue) {
                            taskViewModel.updateCategory(newValue!);
                          },
                          items: <String>['Cozinha', 'Sala', 'Quarto']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        const Text("Selecione os membros"),
                        const SizedBox(height: 8),
                        Column(
                          children: _members.map((member) {
                            return CheckboxListTile(
                              title: Text(member.name),
                              value: taskViewModel.selectedMembers
                                  .contains(member),
                              onChanged: (bool? value) {
                                if (value == true) {
                                  taskViewModel.updateMembers(
                                    [...taskViewModel.selectedMembers, member],
                                  );
                                } else {
                                  taskViewModel.updateMembers(
                                    taskViewModel.selectedMembers
                                        .where((m) => m != member)
                                        .toList(),
                                  );
                                }
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_titleController.text.isNotEmpty &&
                                _descriptionController.text.isNotEmpty) {
                              final newTask = Task(
                                id: DateTime.now().millisecondsSinceEpoch,
                                title: _titleController.text,
                                description: _descriptionController.text,
                                type: _typeController.text,
                                group: taskViewModel.selectedGroup,
                                category: taskViewModel.selectedCategory,
                                members: taskViewModel.selectedMembers,
                              );

                              taskViewModel.addTask(newTask);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Adicionar Tarefa"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          // Se existirem tarefas, elas são exibidas
          if (taskViewModel.tasks.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: taskViewModel.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskViewModel.tasks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        task.title,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Descrição: ${task.description}'),
                          const SizedBox(height: 8),
                          Text('Categoria: ${task.category}'),
                          const SizedBox(height: 8),
                          Text('Grupo: ${task.group}'),
                          const SizedBox(height: 8),
                          Text(
                              'Membros: ${task.members.map((e) => e.name).join(', ')}'),
                        ],
                      ),
                      trailing: const Icon(Icons.check_circle_outline),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
