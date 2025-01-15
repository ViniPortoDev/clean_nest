// lib/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/modules/auth/src/domain/entities/mascot_entity.dart';

class ChooseMascotViewModel extends BaseViewModel {
  final ChooseMascotRepository repository;
  List<Mascot> mascots = [];
  Mascot? selectedMascot;

  ChooseMascotViewModel(this.repository);

  void loadMascots() {
    setLoading(true);
    try {
      mascots =  repository.fetchMascots();
    } catch (e) {
      mascots = [];
    } finally {
      setLoading(false);
    }
  }

  void selectMascot(Mascot mascot) {
    selectedMascot = mascot;
    notifyListeners();
  }
}
