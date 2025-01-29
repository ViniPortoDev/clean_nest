// import 'package:clean_nest/modules/home/src/ui/viewmodels/task_viewmodel.dart';
// import 'package:flutter/material.dart';

// class AddTaskBottomSheet extends StatelessWidget {
//   final TaskViewModel viewModel;

//   const AddTaskBottomSheet({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Adicionar Tarefa", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: "Tipo de Tarefa"),
            items: ["Bug", "Feature", "Melhoria"].map((type) {
              return DropdownMenuItem(value: type, child: Text(type));
            }).toList(),
            onChanged: (value) => viewModel.setType(value!),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Grupo"),
            onChanged: (value) => viewModel.setGroup(value),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Categoria"),
            onChanged: (value) => viewModel.setCategory(value),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Participantes (separados por vírgula)"),
            onChanged: (value) {
              viewModel.setParticipants(
                value.split(',').map((e) => e.trim()).toList(),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: viewModel.canAddTask()
                ? () {
                    Navigator.pop(context); // Fecha o BottomSheet
                    // Lógica para adicionar tarefa
                  }
                : null,
            child: const Text("Adicionar Tarefa"),
          ),
        ],
      ),
    );
  }
}

