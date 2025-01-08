import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/shared/widgets/cn_appbar_widget.dart';
import 'package:clean_nest/shared/widgets/cn_scaffold_widget.dart';
import 'package:clean_nest/shared/widgets/dropdowns/cn_dropdown_widget.dart';
import 'package:clean_nest/shared/widgets/inputs/cn_primary_input_widget.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeTextStyle = theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    final size = MediaQuery.of(context).size;

    return CnScaffoldWidget(
      appBar: const CnAppBarWidget(title: 'Add Task', showBackButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CnPrimaryTextInput(
            hintText: 'Título da tarefa',
          ),
          SizedBox(height: themeSpacing!.spacing24px),
          CnDropdownWidget(
            labelText: "Grupo",
            items: ["Opção 1", "Opção 2", "Opção 3"],
            selectedValue: selectedValue, // Começa como null
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          SizedBox(height: themeSpacing!.spacing24px),
          CnDropdownWidget(
            labelText: "Categoria",
            items: ["Opção 1", "Opção 2", "Opção 3"],
            selectedValue: selectedValue, // Começa como null
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          SizedBox(height: themeSpacing!.spacing24px),
          CnDropdownWidget(
            labelText: "Selecionar Participantes",
            items: ["Opção 1", "Opção 2", "Opção 3"],
            selectedValue: selectedValue, // Começa como null
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
