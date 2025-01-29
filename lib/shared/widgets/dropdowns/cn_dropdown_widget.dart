import 'package:flutter/material.dart';

class CnDropdownWidget extends StatelessWidget {
  final String labelText; // O label fixo dentro do dropdown
  final List<String> items; // Lista de itens do dropdown
  final String? selectedValue; // Valor selecionado no dropdown
  final ValueChanged<String?>
      onChanged; // Callback para quando um item for selecionado

  const CnDropdownWidget({
    super.key,
    required this.labelText,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // O label fixo que aparece dentro do campo
          Text(
            labelText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
          const SizedBox(height: 4), // Espaçamento entre o label e o dropdown
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              hint: Text(
                "Categoria", // Texto dentro do campo
                style: TextStyle(
                  color:
                      selectedValue == null ? Colors.grey : Colors.transparent,
                  fontSize: 16,
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: onChanged, // Atualiza o valor selecionado
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.teal,
                size: 30, // Ajuste no tamanho do ícone
              ),
              isDense: true, // Ajusta o ícone para ficar mais centralizado
            ),
          ),
        ],
      ),
    );
  }
}
