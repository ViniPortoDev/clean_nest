import 'package:clean_nest/modules/auth/src/domain/entities/mascot_entity.dart';

abstract class ChooseMascotRepository {
   List<Mascot> fetchMascots();
}
