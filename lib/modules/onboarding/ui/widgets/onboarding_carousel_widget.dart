// import 'package:flutter/material.dart';

// class OnboardingCarouselWidget extends StatelessWidget {
//   final PageController controller;
//   final Function(int)? onPageChanged;

//   const OnboardingCarouselWidget({
//     super.key,
//     required this.controller,
//     this.onPageChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: controller,
//       onPageChanged: onPageChanged,
//       children: [
//         _buildPage(
//           title: 'Organize suas tarefas',
//           description: 'Distribua as tarefas de forma justa e intuitiva.',
//           imagePath: 'assets/images/news.png',
//         ),
//         _buildPage(
//           title: 'Crie grupos facilmente',
//           description: 'Gerencie as tarefas de um grupo com praticidade.',
//           imagePath: 'assets/images/daily-tasks.png',
//         ),
//         _buildPage(
//           title: 'Evite conflitos',
//           description: 'Deixe o app dividir as tarefas de forma divertida.',
//           imagePath: 'assets/images/repeat.png',
//         ),
//       ],
//     );
//   }

//   Widget _buildPage({required String title, required String description, required String imagePath}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(imagePath, height: 200),
//           SizedBox(height: 24),
//           Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//           SizedBox(height: 16),
//           Text(description, textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }
