import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/modules/home/src/domain/entities/task.dart';
import 'package:clean_nest/modules/home/src/ui/viewmodels/task_viewmodel.dart';
import 'package:clean_nest/modules/home/src/ui/widgets/add_task_container_widget.dart';
import 'package:clean_nest/modules/home/src/ui/widgets/select_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:clean_nest/core/domain/entities/member.dart';

class HomePage extends StatefulWidget {
  final TaskViewModel taskViewModel;
  const HomePage({super.key, required this.taskViewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();
    final TextEditingController _typeController = TextEditingController();
    int _currentIndex = 0;

    // Lista de ícones para o menu
    final iconList = <IconData>[
      Icons.home,
      Icons.star,
      Icons.settings,
      Icons.person,
    ];

    final List<Member> _members = [
      Member(id: 1, name: 'Membro 1', email: '', tasks: []),
      Member(id: 2, name: 'Membro 2', email: '', tasks: []),
      Member(id: 3, name: 'Membro 3', email: '', tasks: []),
    ];

    return Scaffold(
      appBar: AppBar(
        title: SelectedGroupWidget(
          groupName: widget.taskViewModel.selectedGroup,
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
          if (widget.taskViewModel.tasks.isEmpty)
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
                          value: widget.taskViewModel.selectedGroup,
                          onChanged: (String? newValue) {
                            widget.taskViewModel.updateGroup(newValue!);
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
                          value: widget.taskViewModel.selectedCategory,
                          onChanged: (String? newValue) {
                            widget.taskViewModel.updateCategory(newValue!);
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
                              value: widget.taskViewModel.selectedMembers
                                  .contains(member),
                              onChanged: (bool? value) {
                                if (value == true) {
                                  widget.taskViewModel.updateMembers(
                                    [
                                      ...widget.taskViewModel.selectedMembers,
                                      member
                                    ],
                                  );
                                } else {
                                  widget.taskViewModel.updateMembers(
                                    widget.taskViewModel.selectedMembers
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
                                group: widget.taskViewModel.selectedGroup,
                                category: widget.taskViewModel.selectedCategory,
                                members: widget.taskViewModel.selectedMembers,
                              );

                              widget.taskViewModel.addTask(newTask);
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
          if (widget.taskViewModel.tasks.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: widget.taskViewModel.tasks.length,
                itemBuilder: (context, index) {
                  final task = widget.taskViewModel.tasks[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
      floatingActionButton: GestureDetector(
        onTap: () {
          // Lógica ao clicar no botão
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline,
                      color: Colors.blueAccent, size: 32),
                  SizedBox(width: 8),
                  Text(
                    'Adicionar',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              content: Text(
                'Deseja adicionar este item?',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Lógica para adicionar o item
                  },
                  child: Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: cnColorScheme.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 36,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home_rounded,
          Icons.explore_rounded,
          Icons.leaderboard_rounded,
          Icons.person_rounded,
        ],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        backgroundColor: Colors.white,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey[400],
        iconSize: 28,
        elevation: 8,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        splashColor: Colors.blueAccent.withOpacity(0.2),
        splashSpeedInMilliseconds: 250,
      ),
    );
  }
}
