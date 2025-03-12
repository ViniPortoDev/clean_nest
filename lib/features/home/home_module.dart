// import 'package:clean_nest/features/home/src/ui/pages/add_task_page.dart';
// import 'package:clean_nest/features/home/src/ui/pages/home_page.dart';
// import 'package:clean_nest/features/home/src/ui/viewmodels/home_viewmodel.dart';
// import 'package:clean_nest/features/home/src/ui/viewmodels/task_viewmodel.dart';

// class HomeModule extends Module {
 
  
//   @override
//   void binds(i) {

//     // Viewmodels
//     i.addSingleton(TaskViewModel.new);
//     i.addSingleton(HomeViewmodel.new);
//   }

//   @override
//   void routes(r) {
//     r.child('/',
//         child: (context) => HomePage(
//               taskViewModel: context.read(),
//               homeViewmodel: context.read(),
//             ));
//     r.child('/add_task', child: (context) => const AddTaskPage());
//   }
// }
