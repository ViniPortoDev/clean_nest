import 'package:flutter/material.dart';

class SelectedGroupWidget extends StatelessWidget {
  final String groupName; // Nome do grupo selecionado.
  final VoidCallback onTap; // Função para abrir o BottomSheet ou outra ação.

  const SelectedGroupWidget({
    super.key,
    required this.groupName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Nome do grupo
            Row(
              children: [
                const Icon(
                  Icons.group,
                  color: Colors.purple,
                  size: 28,
                ),
                const SizedBox(width: 8),
                Text(
                  groupName.isNotEmpty ? groupName : "Escolha um grupo 🎉",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold,
                    fontFamily: "ComicSans", // Fonte divertida.
                  ),
                ),
              ],
            ),
            // Seta ao lado direito
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.purple,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
