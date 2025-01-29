import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';

class ChooseMascotRepositoryImpl implements ChooseMascotRepository {
  @override
  List<Mascot> fetchMascots() {
    return [
      Mascot(
          id: 1, name: 'Mascot A', imageUrl: 'assets/images/logo_elizeu.png'),
      Mascot(
          id: 2, name: 'Mascot B', imageUrl: 'assets/images/logo_elizeu.png'),
      Mascot(
          id: 3, name: 'Mascot C', imageUrl: 'assets/images/logo_elizeu.png'),
    ];
  }
}
