import 'package:clean_nest/modules/home/src/ui/pages/add_task_page.dart';
import 'package:clean_nest/modules/home/src/ui/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/add_task', child: (context) => const AddTaskPage());
  }
}
