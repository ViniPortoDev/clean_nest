import 'package:clean_nest/core/entities/mascot.dart';

abstract class ChooseMascotRepository {
  List<Mascot> fetchMascots();
}
